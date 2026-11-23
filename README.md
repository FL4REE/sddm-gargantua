# sddm-gargantua

Animated SDDM login screen with the black hole *Gargantua* from Interstellar, as a variant of [sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) by Keyitdev.

- Looping video background (2560×1440, 60 fps, H.264, no audio)
- Placeholder frame while the video loads, so there's no black flash
- Amber/cream color scheme matched to the accretion disk
- Login form on the left with partial blur over the video

## Requirements

- `sddm` (Qt6)
- [sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) installed under `/usr/share/sddm/themes/sddm-astronaut-theme`
- `qt6-multimedia` + `qt6-multimedia-ffmpeg` for video playback, plus `qt6-svg` and `qt6-virtualkeyboard`

## Installation

```bash
git clone https://github.com/FL4REE/sddm-gargantua.git
cd sddm-gargantua
./install.sh
```

The script copies `gargantua.mp4`, `gargantua.png` and `gargantua.conf` into the astronaut theme and sets `ConfigFile=Themes/gargantua.conf` in its `metadata.desktop`. The astronaut theme must be the active SDDM theme (`[Theme] Current=sddm-astronaut-theme` in `/etc/sddm.conf`).

Preview without logging out:

```bash
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme
```

## Other resolutions

`gargantua.conf` is set to 2560×1440. For other monitors, adjust `ScreenWidth`/`ScreenHeight` and ideally rescale the video:

```bash
ffmpeg -i gargantua.mp4 -vf scale=1920:1080:flags=lanczos -c:v libx264 -crf 18 -an -movflags +faststart gargantua-1080p.mp4
```

## Revert

Set `ConfigFile` in `/usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop` back to, for example, `Themes/black_hole.conf`.

## Credits

- Theme: [Keyitdev/sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme) (GPL-3.0)
- Video: [Interstellar Gargantua black hole 4K live wallpaper](https://www.youtube.com/watch?v=gU4vSEZwiyE) (YouTube); the rights belong to the original creator.
