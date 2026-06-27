# Changelog — GOF2 Mod

## Build 002 — God Mode (2026-06-27)
**Status**: ⚠️ God Mode funciona, mas inimigos também ficam invencíveis

### O que foi feito:
- Patch binário no `libgof2hdaa.so` para desativar dano
- `Player::damage(int)` em 0x0a3694 → substituído por `BX LR` (retorno imediato)
- `Player::damage(int,bool,int)` em 0x0a31c0 → substituído por `BX LR` (retorno imediato)
- Smali mods do Build 001 mantidos (DLC, verifyPurchase, ships.bin)
- .so injetado no APK após compilação (apktool corrompe o .so ao recompilar)

### Resultado:
- ✅ God Mode funciona (jogador não recebe dano)
- ❌ Hit Kill NÃO funciona (inimigos também não recebem dano)
- ❌ Player::damage é compartilhado entre jogador e inimigos (KIPlayer herda de Player)

### Técnica usada:
```
Apktool compila APK → APK fica com .so corrompido
Python substitui .so dentro do APK pelo .so patchado
Apksigner assina o APK final
```

### Arquivos:
- APK: `builds/build_002_godmode.apk` (7.8 MB)
- .so patchado: `decompiled/libgof2hdaa_patched.so`

### Próximo passo:
Encontrar forma de desativar dano APENAS para o jogador (PlayerEgo), não para inimigos.
Opções:
1. Patch em PlayerEgo::update para escrever vida máxima a cada frame
2. Encontrar onde o jogo distingue jogador de inimigo no processamento de dano

---

## Build 001 — Mods Smali (2026-06-26)
**Status**: ✅ Funcional (sem mods nativos)

### O que foi feito:
- DLC 1-5 flags alterados de `false` para `true` em GooglePlayIAP.smali
- `Security.verifyPurchase()` modificada para sempre retornar `true`
- `ships.bin` copiado do KiritoJPK com stats alterados para 9999
- .so mantido original (sem patch)

### Resultado:
- ✅ DLCs desbloqueados
- ✅ Compras verificadas
- ✅ Stats das naves em 9999
- ❌ Sem God Mode, Hit Kill, ou outros mods nativos

### Arquivos:
- APK: `builds/build_001_smali_mods.apk` (7.5 MB)

---

## Build 000 — APK Original (2026-06-26)
**Status**: ✅ Funcional (sem mods)

### O que foi feito:
- APK original `[Unlocked+Money]` copiado para backup
- Decompilado com apktool para análise

### Arquivos:
- APK: `backups/original_unlocked_money.apk` (6.8 MB)
