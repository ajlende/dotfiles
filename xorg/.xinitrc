[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.fehbg ]] && ~/.fehbg &
unclutter &
exec spectrwm

