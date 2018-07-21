KDE-at-Arch
=============
Random notes on how to tune KDE on Arch Linux.

Font
----------
See [here](https://github.com/ZeppLu/rcs/blob/master/config/fontconfig/fonts.conf).

HiDPI
-----------
Set your favorite scaling factor in `System Settings -> Display and Monitor -> Displays -> Scale Display`.

Notes that non-integer scaling factor will bring some issues, including:
1. Some icons in some apps appears blurry.
2. Some text in some apps appears mis-positioned.
3. Konsole and Yaquake show transperent horizontal lines randomly.

Generally speaking, 1 and 2 are quite rare (compared to Windows), but 3 is just annoying. It's known as [a bug](https://bugs.kde.org/show_bug.cgi?id=373232) and seems being worked on. If you can't afford those ugly lines, [this dirty trick](https://gist.github.com/ZeppLu/637353565e5be6b8275a859f7c412f8c) may help.

For SDDM, the following config makes it work well (from [Arch Wiki](https://wiki.archlinux.org/index.php/SDDM#DPI_settings)).
```conf
# /etc/sddm.conf.d/dpi.conf
[X11]
ServerArguments=-nolisten tcp -dpi 166  # calculate your screen's real DPI on http://www.pxcalc.com and paste it here
```

Cursor
-------------
Fix terrible old-style cursor shown on titlebar:
```conf
# /usr/share/icons/default/index.theme
[Icon Theme]
#Inherits=Adwaita
Inherits=breeze_cursors
```

Input Device
-------------
If you want to activate applications launcher simply by pressing <kbd>Win</kbd>, just as what you do on Windows,
- When using Latte-Dock, have a look at [here](https://github.com/psifidotos/Latte-Dock/wiki/F.A.Q.).
- When using plasma dock, set it's shortcut to <kbd>Alt</kbd>+<kbd>F1</kbd>.

TODO
---------
- [ ] latte-dock settings backup
- [ ] theme, including workspace, titlebar, icon (take a look at [this](https://www.reddit.com/r/unixporn/comments/8uhjzk/kde_plasma/))
- [ ] global menu for GTK apps, mainly chrome and vscode
