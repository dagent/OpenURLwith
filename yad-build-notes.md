
### Building YAD
(This was initially done on Mint 22.3)

Find an appropriate directory, then
```
git clone https://github.com/v1cont/yad.git yad-dialog-code
cd yad-dialog-code
sudo apt install automake autopoint intltool libgtk-3*
autoreconf -ivf
./configure && make && sudo make install
```

Test by `yad --about` and a dialog should pop up.

**Help from** https://forums.linuxmint.com/viewtopic.php?t=440739
