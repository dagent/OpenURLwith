#/bin/bash

# Install OpenURL files to all the places.  Some error checking in here,
# but not exhaustive.  This should really be done with a Makefile...
#
# ALPHA -- probably not really useful
#

exit 0

fatal () {
    echo "[FATAL, $LINENO] $@" >$2
    exit 1
}
file=( OpenURLwith OpenURLwith.desktop )
cmds=( update-desktop-database xdg-settings )

for file in "${files[@]}" ; do
    [ -f $file ] || fatal "$file missing"
done

for cmd in "${cmds[@]}" ; do
    [ $(type -t $cmd) = "file" ] || fatal "$cmd missing"
done

echo "Copying script to $HOME/bin"
cp OpenURLwith $HOME/bin || fatal 
chmod 755 $HOME/bin/OpenURLwith || fatal
ls -l $HOME/bin/OpenURLwith

echo "Installing desktop file"
cp OpenURLwith.desktop $HOME/.local/share/applications || fatal
chmod 755 $HOME/.local/share/applications/OpenURLwith.desktop || fatal
ls -l $HOME/.local/share/applications/OpenURLwith.desktop  || fatal

update-desktop-database ~/.local/share/applications || fatal 


exit 0

#  This next bit needs some testing and User input
xdg-settings set default-web-browser OpenURLwith.desktop
grep OpenURLwith $HOME/.config/mimeapps.list
