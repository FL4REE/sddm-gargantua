#!/usr/bin/env bash
# Installiert die Gargantua-Variante ins sddm-astronaut-theme und aktiviert sie.
set -euo pipefail
cd "$(dirname "$0")"
T=/usr/share/sddm/themes/sddm-astronaut-theme
[ -d "$T" ] || { echo "Theme nicht gefunden: $T"; exit 1; }
sudo install -m 644 gargantua.mp4 gargantua.png "$T/Backgrounds/"
sudo install -m 644 gargantua.conf "$T/Themes/"
sudo sed -i 's|^ConfigFile=.*|ConfigFile=Themes/gargantua.conf|' "$T/metadata.desktop"
grep '^ConfigFile' "$T/metadata.desktop"
echo "Fertig. Testen: sddm-greeter-qt6 --test-mode --theme $T"
