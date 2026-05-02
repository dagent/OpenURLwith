
# OpenURLwith

An HTTP(S) mime-type browser-chooser "system" for Linux desktops.

## The Problem to solve

**Scenario:** I click on a link in an email, and it pops open a tab in
whatever last FireFox window I had.  *BUT*!  I really need it to open in
Chrome because that's where I do whatever with a Google account (which I
never use my FireFox for...).

**A Solution:** Make my *default web browser* a dialog which allows me to
pick my web application.  I'm going to call that _OpenURLwith_.

###  Even more features (in the future)

**Profiles:** It would be great to select which profile to open a
website with -- I use profiles in both FireFox and Chrome.

**Private/Guest:** Or, just open in a completely non-Profile window.

## Requirements

Development done using Linux Mint MATE 22.3 and Debian 13 Mate.  My
guess/hope is that any mondernish freedesktop.org "compliant"[^1]
Linux should work.

* BASH
* [YAD](https://github.com/v1cont/yad) -- See the yad-build-notes.md for
  how I installed it.  Repository versions are quite old, but seem to
  work well enough for this purpose.

[^1] I really don't know if "compliant" is even appropriate here.  

## Installation

Put the **OpenURLwith** script someplace in your $PATH, and make
executable.  I leave mine in ~/bin:

`cp OpenURLwith $HOME/bin; chmod 755 $HOME/bin/OpenURLwith`

You should be able to run this from the command line -- it will open
blank windows if not given a URL.

### Copy the desktop file:
`cp OpenURLwith.desktop $HOME/.local/share/applications`

Open this file in an editor and make sure the Exec portion points to a
valid executable.  Double click, and see if it launches, or if you have
to mark it "trusted" (which you should do).  *This is often the hardest
thing to get working right*. Consider (for xfce):
```
f="$HOME/.local/share/applications/OpenURLwith.desktop"
gio set -t string "$f" metadata::xfce-exe-checksum "$(sha256sum "$f" | awk '{print $1}')"
```
... which might be needed 

Possibly may need to register the file:
`update-desktop-database ~/.local/share/applications`

At this point, you should be able to see **OpenURLwith** in your
Desktop's application menu, and possibly as an option in a
*default/preferred application* setting.

If you need to force it as the default browser, this should work:
`xdg-settings set default-web-browser OpenURLwith.desktop`

## Configuration

The only real configuration involves editing the **OpenURLwith** script.
Namely, adding/removing *Launchers* definitions and invocations. 

## Testing

Clicking on an html file, or running `xdg-open URL` should trigger the
script.


