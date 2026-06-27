#!/bin/bash
# GOF2 Mod - Install Script
# Atualiza por cima sem desinstalar (preserva save e OBB automaticamente)
# Uso: ./scripts/install.sh [caminho_apk] [--clean]
#   --clean  : Desinstala antes (modo limpo, mantém OBB)

set -e

ADB="$HOME/android-sdk/platform-tools/adb"
PKG="net.fishlabs.gof2hdallandroid2012"
BASE="/home/lima/Projetos/GOF2-Mod"

CLEAN=0
APK=""
for arg in "$@"; do
    case "$arg" in
        --clean) CLEAN=1 ;;
        *) APK="$arg" ;;
    esac
done

APK="${APK:-$(ls -t $BASE/builds/*.apk 2>/dev/null | head -1)}"

if [ -z "$APK" ] || [ ! -f "$APK" ]; then
    echo "Uso: $0 [caminho_apk] [--clean]"
    echo "Nenhum APK encontrado em builds/"
    exit 1
fi

echo "=== GOF2 Mod — Instalação ==="
echo "APK: $(basename "$APK")"
echo "Tamanho: $(ls -lh "$APK" | awk '{print $5}')"

# Verifica dispositivo
echo "Verificando dispositivo..."
$ADB devices | grep -q "device$" || { echo "ERRO: Nenhum dispositivo conectado"; exit 1; }

if [ "$CLEAN" -eq 1 ]; then
    # Modo limpo: desinstala primeiro, preserva OBB
    echo ""
    echo ">> Modo LIMPO: desinstalando versão anterior..."

    echo "Preservando OBB..."
    $ADB shell "mv /sdcard/Android/obb/$PKG /sdcard/Android/obb/${PKG}_obb" 2>/dev/null || true

    echo "Desinstalando..."
    $ADB uninstall $PKG 2>/dev/null || true

    echo "Instalando..."
    $ADB install "$APK"

    echo "Restaurando OBB..."
    $ADB shell "mv /sdcard/Android/obb/${PKG}_obb /sdcard/Android/obb/$PKG" 2>/dev/null || true

else
    # Modo atualização: instala por cima (preserva save + OBB automaticamente)
    echo ""
    echo ">> Modo ATUALIZAÇÃO: instalando por cima..."
    echo "   Save e OBB serão preservados automaticamente."

    # Tenta instalar por cima
    if $ADB install -r "$APK" 2>/dev/null; then
        echo "Atualização instalada com sucesso!"
    else
        # Se falhar (assinatura diferente?), tenta modo limpo
        echo ""
        echo "AVISO: Atualização direta falhou. Tentando modo limpo..."
        echo "Preservando OBB..."
        $ADB shell "mv /sdcard/Android/obb/$PKG /sdcard/Android/obb/${PKG}_obb" 2>/dev/null || true

        echo "Desinstalando..."
        $ADB uninstall $PKG 2>/dev/null || true

        echo "Instalando..."
        $ADB install "$APK"

        echo "Restaurando OBB..."
        $ADB shell "mv /sdcard/Android/obb/${PKG}_obb /sdcard/Android/obb/$PKG" 2>/dev/null || true
    fi
fi

# Verifica
echo ""
echo "Verificando..."
if $ADB shell "pm list packages" | grep -q "$PKG"; then
    VERSION=$($ADB shell "dumpsys package $PKG" | grep versionName | head -1 | awk -F= '{print $2}' | tr -d '[:space:]')
    echo "✅ Instalado com sucesso!"
    echo "   Pacote: $PKG"
    echo "   Versão: $VERSION"
else
    echo "❌ Falha na instalação"
    exit 1
fi

echo ""
echo "=== Pronto ==="
