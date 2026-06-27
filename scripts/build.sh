#!/bin/bash
# GOF2 Mod - Build Script
# Usage: ./scripts/build.sh [version] [description]

set -e

BASE="/home/lima/Projetos/GOF2-Mod"
DECOMPILED="$BASE/decompiled"
BUILDS="$BASE/builds"
TOOLS="$BASE/tools"
APKTOOL="/tmp/apktool.jar"
KEYSTORE="/tmp/debug.keystore"
KEYPASS="android"

VERSION="${1:-$(date +%Y%m%d_%H%M)}"
DESC="${2:-auto-build}"
APK_NAME="gof2_mod_v${VERSION}.apk"

echo "=== GOF2 Mod Build v${VERSION} ==="
echo "Description: ${DESC}"

# Check if decompiled source exists
if [ ! -d "$DECOMPILED/smali" ]; then
    echo "ERROR: No decompiled source found in $DECOMPILED"
    echo "Run: java -jar $APKTOOL d <base.apk> -o $DECOMPILED"
    exit 1
fi

# Copy original .so if patched one exists and we want to reset
if [ "$3" = "reset-so" ]; then
    echo "Resetting .so to original..."
    cp "$DECOMPILED/libgof2hdaa_original.so" "$DECOMPILED/smali/../lib/armeabi-v7a/libgof2hdaa.so" 2>/dev/null || true
fi

# Build
echo "Building APK..."
java -jar "$APKTOOL" b "$DECOMPILED" -o "$BUILDS/$APK_NAME" --use-aapt2

# Sign
echo "Signing APK..."
~/android-sdk/build-tools/35.0.0/apksigner sign \
    --ks "$KEYSTORE" \
    --ks-pass "pass:$KEYPASS" \
    --key-pass "pass:$KEYPASS" \
    "$BUILDS/$APK_NAME"

# Verify
echo "Verifying..."
~/android-sdk/build-tools/35.0.0/apksigner verify "$BUILDS/$APK_NAME" && echo "✅ Signature valid"

# Log
echo "$VERSION|$DESC|$APK_NAME|$(date -Iseconds)" >> "$BASE/builds/builds.log"

echo ""
echo "=== Build complete ==="
echo "APK: $BUILDS/$APK_NAME"
echo "Size: $(ls -lh "$BUILDS/$APK_NAME" | awk '{print $5}')"
