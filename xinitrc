export TERM=xterm
setxkbmap gb
xrdb ~/.Xresources

sxhkd &
exec bspwm
