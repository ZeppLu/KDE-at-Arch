HiDPI
=================

First of all, enable scaling in the Displays section of System Settings.

Konsole
-------------
Annoying transparent horizontal lines, so we should force it not to use display scaling by running `fix-konsole.bash`.

Netease Cloud Music
-------------
Use `QT_SCALE_FACTOR` environment variable will make its window terribly huge, but fortunately it also accepts `--force-device-scale-factor` parameter. Run `fix-netease-cloud-music.bash`.

TODO
-----------
- [ ] make NCM use system title bar (actually it does not belong to this section)
