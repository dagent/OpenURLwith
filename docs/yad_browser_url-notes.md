*This is historical.  Many names have changed*

Wed Apr 29 10:04:26 AM PDT 2026

Wanting to make an app to ask me what browser to use when launching URL
handler.

[security - Ask Before Opening URL on Linux - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/776631/ask-before-opening-url-on-linux)

----

Created yad_browser_url.sh, which works ok.

Created ~/.local/share/applications/URL-app-chooser.desktop which execs
to ~/bin/URL-app-chooser, which soft-links to yad_browser_url.sh.  This
shows up in the MATE mintMenu.

`xdg-mime default URL-app-choose.desktop x-scheme-handler/{http,https}`
Had to run twice before it stuck, and it didn't really work.

`xdg-settings set default-web-browser URL-app-chooser.desktop` works
much better!  It's the winner!  However, it doesn't show up in MATE
Preferred Applications settings.

----

Installing dconf-editor -- but that doesn't help find anything.

`update-desktop-database ~/.local/share/applications` apparently update
a mimeinfo.cache somwhere.  Now URL-app-chooser appears in Preferred
Applications.

