[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
unclutter &
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session
