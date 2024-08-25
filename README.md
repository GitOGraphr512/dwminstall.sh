# My dwm install script
-----------------------
prerequisites:
xorg, Xinerama, make, sudo, a modern shell (preferably bash), JetBrainsMono Nerd Font

consult your distro's docs for installation instructions

To, for example, have a background persistant across dwm restarts, you must edit your ~/.xinitrc. With a background program of your choosing, you could edit the default ~/.xinitrc to be like this:

exec dwm &

slstatus &

'background command'

It is highly recommended to start dwm via a tty with 'startx'. I have not and am not planning to test this dwm config using and display managers such as GDM, SDDM, or Ly.
