KDE-at-Arch
=============
Random notes on how to tune KDE on Arch Linux.


Appearance
-----------

#### Font
See [here](https://github.com/ZeppLu/rcs/blob/master/config/fontconfig/fonts.conf).

#### HiDPI
Set your favorite scaling factor in `System Settings -> Display and Monitor -> Displays -> Scale Display`. Before you continue, please ensure you've install the correct driver (`xf86-video-intel` for example), **DO NOT** use mesa!

For SDDM, the following config makes it work well (from [Arch Wiki](https://wiki.archlinux.org/index.php/SDDM#DPI_settings)).
```conf
# /etc/sddm.conf.d/dpi.conf
[X11]
ServerArguments=-nolisten tcp -dpi 166  # calculate your screen's real DPI on http://www.pxcalc.com and paste it here
```

Konsole and Yaquake may show transperent horizontal lines randomly, it's known as [a bug](https://bugs.kde.org/show_bug.cgi?id=373232) and already fixed (update your video driver). But for reference, there's a [dirty trick](https://gist.github.com/ZeppLu/637353565e5be6b8275a859f7c412f8c) I used before.

#### Cursor
Fix terrible old-style cursor shown on titlebar:
```conf
# /usr/share/icons/default/index.theme
[Icon Theme]
#Inherits=Adwaita
Inherits=breeze_cursors
```

#### Top Panel
Latte Dock + 3x Active Window Control (1 for application title, 1 for double click to maximize/restore control, 1 for buttons control).

#### Title Bar
To get a more integrated title bar, follow [this instruction](http://www.alexl.netsons.org/78). To remove the blue horizontal line between title bar and windows, head to `System Settings -> Application Style -> Window Decorations -> Theme -> Configure Breeze` and uncheck a self-explained option.

#### Window Decoration
If an application ask KWin not to draw decoration for it, aka Client Side Decoration, KWin will not draw ANY decoration, including shadow around it. So it will look extremely ugly if the application doesn't do its job well, in this case we can create a window rule to forcefully draw decoration for it, see `ForceBorderNCM.kwinrule` for example.

But there's a known bug: close button on system title bar cannot close NCM correctly, so we need to kill it manually, which is just annoying.

PS: for GNOME apps, there is a package `gtk3-no-csd-git` on AUR to help disable CSD automatically (haven't confirmed).


Control
------------

#### Shortcut
If you want to activate applications launcher simply by pressing <kbd>Win</kbd>, just as what you do on Windows,
- When using Latte-Dock, have a look at [here](https://github.com/psifidotos/Latte-Dock/wiki/F.A.Q.).
- When using plasma dock, set it's shortcut to <kbd>Alt</kbd>+<kbd>F1</kbd>.

#### Global Menu
Global menu works seamlessly on Qt apps. For others like VSCode, Chrome and LibreOffice, install these packages then re-login, though I don't know which one actually do the job:
```sh
sudo pacman -S appmenu-gtk-module libdbusmenu-{glib,gtk{2,3}}
```

#### File Manager
In order to instruct Dolphin to mount disk partitions without requiring root privilege, fisrt `usermod "$USER" -G storage --append` then put [this configuration](https://gist.github.com/Scrumplex/8f528c1f63b5f4bfabe14b0804adaba7) into `/etc/polkit-1/rules.d/`.


TODO
---------
- [ ] upload configurations, including latte-dock settings, customized color schemes, chrome's plugins
- [ ] theme, including workspace, titlebar, icon (take a look at [this](https://www.reddit.com/r/unixporn/comments/8uhjzk/kde_plasma/))
- [ ] kinetic scrolling with libinput
- [ ] shortcuts configurations upload
- [ ] fine-tuning of the top panel (how to make title always locate at the center, at the same time don't shadow the global menu?)
- [ ] fix netease cloud music (close button)
