export TERM=xterm
export ALSA_CARD=PCH
setxkbmap gb
xrdb ~/.Xresources
~/.fehbg
compton -cCGfb --inactive-dim 0.15 -D 3 --focus-exclude "x=0 && y=0 && override_redirect=true"
unclutter &

sxhkd &
exec bspwm
