#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load compton composite manager
compton -b &

# Load up the Network Time Protocol daemon
[ ! -s /etc/ntp.conf ] && ntpd

# Load settings for low-level X applications
# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ -d ~/.Xresources.d ]; then
  for f in ~/.Xresources.d/*; do
    [ -r "$f" ] && xrdb -merge "$f"
  done
  unset f
fi

# Restore the previous wallpaper
# nitrogen --restore &
/home/ajlende/Documents/GitHub/wp/wp change

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && mpd

# DEFAULTSESSION=awesome

# case "$1" in
#     awesome    ) exec awesome ;;
#     xfce|xfce4 ) exec startxfce4 ;;
#     *          ) exec $DEFAULTSESSION ;;
# esac

exec $1
