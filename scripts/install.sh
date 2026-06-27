#!/bin/bash
# GOF2 Mod - Install Script
# Preserves OBB and saves game data
# Usage: ./scripts/install.sh [apk_path]

set -e

ADB="$HOME/android-sdk/platform-tools/adb"
PKG="net.fishlabs.gof2hdallandroid2012"
BASE="/home/lima/Projetos/GOF2-Mod"

APK="${1:-$(ls -t $BASE/builds/*.apk 2>/dev/null | head -1)}"

if [ -z "$APK" ] || [ ! -f "$APK" ]; then
    echo "Usage: $0 [apk_path]"
    echo "No APK found in builds/"
    exit 1
fi

echo "=== GOF2 Mod Install ==="
echo "APK: $APK"
echo "Size: $(ls -lh "$APK" | awk '{print $5}')"

# Check device
echo "Checking device..."
$ADB devices | grep -q "device$" || { echo "ERROR: No device connected"; exit 1; }

# Save game data backup
echo "Backing up save data..."
$ADB shell "cp -r /sdcard/Android/data/$PKG/files /sdcard/Android/data/${PKG}_save_backup 2>/dev/null" || true

# Preserve OBB
echo "Preserving OBB..."
$ADB shell "mv /sdcard/Android/obb/$PKG /sdcard/Android/obb/${PKG}_obb" 2>/dev/null || true

# Uninstall
echo "Uninstalling old app..."
$ADB uninstall $PKG 2>/dev/null || true

# Install
echo "Installing new APK..."
$ADB install "$APK"

# Restore OBB
echo "Restoring OBB..."
$ADB shell "mv /sdcard/Android/obb/${PKG}_obb /sdcard/Android/obb/$PKG" 2>/dev/null || true

# Restore save data
echo "Restoring save data..."
$ADB shell "cp -r /sdcard/Android/data/${PKG}_save_backup/* /sdcard/Android/data/$PKG/files/ 2>/dev/null" || true
$ADB shell "rm -rf /sdcard/Android/data/${PKG}_save_backup 2>/dev/null" || true

# Verify
echo "Verifying..."
$ADB shell "pm list packages" | grep -q "$PKG" && echo "✅ Installed successfully" || echo "❌ Installation failed"

echo ""
echo "=== Done ==="
