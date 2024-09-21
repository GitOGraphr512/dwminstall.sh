# My dwm install script
-----------------------
prerequisites:
xorg, Xinerama, make, sudo, JetBrainsMono Nerd Font

consult your distro's docs for installation instructions

To, for example, have a background persistant across dwm restarts, you must edit your ~/.xinitrc. With a background program of your choosing, you could edit the default ~/.xinitrc to be like this. exec dwm ALWAYS comes last, or you will not be able to load into dwm.

slstatus &

feh --bg-fill /home/larry/wallpapers/background.jpg &

exec dwm

I've only tested this config with startx. I have not tested any DMs.

I will not be telling any dwm noobs how to use dwm. google is free you goof
