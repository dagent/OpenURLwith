#/bin/bash

# Install OpenURL files to all the places.  Some error checking in here,
# but not exhaustive.  This should really be done with a Makefile...
#
# ALPHA -- probably not really useful
#

echo "Aborting -- this is an alpha script, and needs some testing and user input before it can be used.  See the source for details."
exit 0

fatal () {
    echo "[FATAL, $LINENO] $@" >$2
    exit 1
}

## Check for files and commands we need
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

echo "Running to see if it works"
OpenURLwith https://www.google.com || fatal "Script doesn't work"

echo "Installing desktop file"
cp OpenURLwith.desktop $HOME/.local/share/applications || fatal
chmod 755 $HOME/.local/share/applications/OpenURLwith.desktop || fatal
ls -l $HOME/.local/share/applications/OpenURLwith.desktop  || fatal

echo "Running `gio launch $HOME/.local/share/applications/OpenURLwith.desktop` to see if it works"
echo "This may prompt your desktop environment to ask you to trust the file. Please click 'Trust and Launch' or similar."
gio launch $HOME/.local/share/applications/OpenURLwith.desktop

update-desktop-database ~/.local/share/applications || fatal 


exit 0

#  This next bit needs some testing and User input
xdg-settings set default-web-browser OpenURLwith.desktop
grep OpenURLwith $HOME/.config/mimeapps.list
