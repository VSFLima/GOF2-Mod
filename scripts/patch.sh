#!/bin/bash
# GOF2 Mod - Patch Script
# Applies all mods to the decompiled source
# Usage: ./scripts/patch.sh

set -e

BASE="/home/lima/Projetos/GOF2-Mod"
DECOMPILED="$BASE/decompiled"

echo "=== GOF2 Mod Patcher ==="

# Check if decompiled exists
if [ ! -d "$DECOMPILED/smali" ]; then
    echo "ERROR: No decompiled source found"
    exit 1
fi

echo "Applying smali mods..."

# DLC Unlock
echo "  [1/4] DLC Unlock..."
sed -i 's/\.field private static DLC_1_BOUGHT:Z = false/.field private static DLC_1_BOUGHT:Z = true/' "$DECOMPILED/smali/net/fishlabs/googleplay/GooglePlayIAP.smali"
sed -i 's/\.field private static DLC_2_BOUGHT:Z = false/.field private static DLC_2_BOUGHT:Z = true/' "$DECOMPILED/smali/net/fishlabs/googleplay/GooglePlayIAP.smali"
sed -i 's/\.field private static DLC_3_BOUGHT:Z = false/.field private static DLC_3_BOUGHT:Z = true/' "$DECOMPILED/smali/net/fishlabs/googleplay/GooglePlayIAP.smali"
sed -i 's/\.field private static DLC_4_BOUGHT:Z = false/.field private static DLC_4_BOUGHT:Z = true/' "$DECOMPILED/smali/net/fishlabs/googleplay/GooglePlayIAP.smali"
sed -i 's/\.field private static DLC_5_BOUGHT:Z = false/.field private static DLC_5_BOUGHT:Z = true/' "$DECOMPILED/smali/net/fishlabs/googleplay/GooglePlayIAP.smali"
echo "    ✅ DLC 1-5 desbloqueado"

# VerifyPurchase bypass
echo "  [2/4] VerifyPurchase bypass..."
cat > /tmp/verify_patch.py << 'PYEOF'
import sys

fpath = sys.argv[1]
with open(fpath, 'r') as f:
    content = f.read()

old = """.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation"""

new = """.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1"""

content = content.replace(old, new)

# Find the method and replace body
import re
pattern = r'(\.method public static verifyPurchase.*?\.end method)'
replacement = """.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""

content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open(fpath, 'w') as f:
    f.write(content)

print("    ✅ VerifyPurchase always returns true")
PYEOF
python3 /tmp/verify_patch.py "$DECOMPILED/smali/net/fishlabs/googleplay/Security.smali"

# Data mods
echo "  [3/4] Copying data files..."
cp "$BASE/decompiled/ships.bin" "$DECOMPILED/assets/data/bin/ships.bin" 2>/dev/null && echo "    ✅ ships.bin (stats 9999)" || echo "    ⚠️ ships.bin not found"
cp "$BASE/decompiled/items.bin" "$DECOMPILED/assets/data/bin/items.bin" 2>/dev/null && echo "    ✅ items.bin" || echo "    ⚠️ items.bin not found"

# .so mods
echo "  [4/4] .so mods..."
if [ -f "$DECOMPILED/libgof2hdaa_original.so" ]; then
    cp "$DECOMPILED/libgof2hdaa_original.so" "$DECOMPILED/lib/armeabi-v7a/libgof2hdaa.so"
    echo "    ⏳ .so reset to original (native mods not yet implemented)"
else
    echo "    ⚠️ Original .so not found"
fi

echo ""
echo "=== Patch complete ==="
echo "Run ./scripts/build.sh to compile"
