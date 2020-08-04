# SpectrWM needs spectrwm_cmd from local bin on the path
export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

$HOME/.fehbg &
unclutter &
exec spectrwm

