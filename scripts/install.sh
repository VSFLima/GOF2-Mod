#!/bin/bash
# GOF2 Mod - Install Script v2
# Sempre preserva OBB e save do jogo
# Uso: ./scripts/install.sh [caminho_apk]
#
# NOTA: Como o APK mod tem assinatura diferente do original,
# é NECESSÁRIO desinstalar antes. Mas este script preserva:
# - OBB (1GB de texturas/modelos)
# - Save do jogo (progresso, créditos, naves)
# - Sons e dados em /sdcard/Android/data/

set -e

ADB="$HOME/android-sdk/platform-tools/adb"
PKG="net.fishlabs.gof2hdallandroid2012"
BASE="/home/lima/Projetos/GOF2-Mod"

APK="${1:-$(ls -t $BASE/builds/*.apk 2>/dev/null | head -1)}"

if [ -z "$APK" ] || [ ! -f "$APK" ]; then
    echo "Uso: $0 [caminho_apk]"
    exit 1
fi

echo "=== GOF2 Mod — Instalação ==="
echo "APK: $(basename "$APK")"
echo "Tamanho: $(ls -lh "$APK" | awk '{print $5}')"

# Verifica dispositivo
$ADB devices | grep -q "device$" || { echo "ERRO: Nenhum dispositivo conectado"; exit 1; }

echo ""
echo ">> Preservando dados do jogo..."

# 1. Backup do save em /sdcard/Android/data/
echo "   Backup de save/data..."
$ADB shell "rm -rf /sdcard/Android/data/${PKG}_backup 2>/dev/null" || true
$ADB shell "cp -r /sdcard/Android/data/$PKG /sdcard/Android/data/${PKG}_backup 2>/dev/null" || true

# 2. Backup do OBB
echo "   Backup de OBB..."
$ADB shell "rm -rf /sdcard/Android/obb/${PKG}_backup 2>/dev/null" || true
$ADB shell "cp -r /sdcard/Android/obb/$PKG /sdcard/Android/obb/${PKG}_backup 2>/dev/null" || true

# 3. Backup do save interno via run-as (se possível)
echo "   Tentando backup de save interno..."
$ADB shell "run-as $PKG tar czf /sdcard/gof2_save_backup.tar.gz -C /data/data/$PKG shared_prefs files 2>/dev/null" || echo "   (save interno não acessível sem root)"

echo ""
echo ">> Desinstalando versão anterior..."
$ADB uninstall $PKG 2>/dev/null || true

echo ""
echo ">> Instalando nova versão..."
$ADB install "$APK"

echo ""
echo ">> Restaurando dados do jogo..."

# 1. Restaura save/data
echo "   Restaurando save/data..."
$ADB shell "cp -r /sdcard/Android/data/${PKG}_backup/* /sdcard/Android/data/$PKG/ 2>/dev/null" || true
$ADB shell "rm -rf /sdcard/Android/data/${PKG}_backup 2>/dev/null" || true

# 2. Restaura OBB
echo "   Restaurando OBB..."
$ADB shell "cp -r /sdcard/Android/obb/${PKG}_backup/* /sdcard/Android/obb/$PKG/ 2>/dev/null" || true
$ADB shell "rm -rf /sdcard/Android/obb/${PKG}_backup 2>/dev/null" || true

# 3. Restaura save interno
echo "   Tentando restaurar save interno..."
$ADB shell "run-as $PKG tar xzf /sdcard/gof2_save_backup.tar.gz -C / 2>/dev/null" || true
$ADB shell "rm -f /sdcard/gof2_save_backup.tar.gz 2>/dev/null" || true

# Verifica
echo ""
if $ADB shell "pm list packages" | grep -q "$PKG"; then
    echo "✅ Instalado com sucesso!"
    echo "   Save e OBB preservados."
else
    echo "❌ Falha na instalação"
    exit 1
fi

echo ""
echo "=== Pronto ==="
