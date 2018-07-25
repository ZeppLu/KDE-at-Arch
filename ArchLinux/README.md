Arch Linux Installation Memo
===============


Miscellaneous stuff related to installation and setup of Arch Linux.


Localization
---------
It's recommended to set hardware clock to use UTC, and let Windows be aware of it. Consult [this link](https://wiki.archlinux.org/index.php/Time) for more details.

Locale defaults to C in Arch, set it manually by `sudo localectl set-locale LANG=en_US.UTF-8`.


Multimedia
---------
[mpv](https://mpv.io) is recommended for its efficiency.

To make it controllable by Fn keys as well as plasma media control, install [mpv-mpris](https://aur.archlinux.org/packages/mpv-mpris) from AUR.

TODO: config
