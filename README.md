# My dwm install script
-----------------------
prerequisites:
xorg, Xinerama, make, sudo, a modern shell (preferably bash), JetBrainsMono Nerd Font

consult your distro's docs for installation instructions

To, for example, have a background persistant across dwm restarts, you must edit your ~/.xinitrc. With a background program of your choosing, you could edit the default ~/.xinitrc to be like this. Just remember, exec dwm ALWAYS comes last.

slstatus &

'background command' &

exec dwm

I've only tested this config with startx. I have not tested any DMs.
