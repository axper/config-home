#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Environment vars - also see .zshenv
export PATH=$PATH:~/.scripts/:~/.scripts-games:$(ruby -rubygems -e "puts Gem.user_dir")/bin

# Reload .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disk automounter
udiskie --tray &

# Keyboard layouts & disable caps lock
#setxkbmap -layout us,am,ru -variant ,phonetic-alt,phonetic -option 'grp:alt_space_toggle,caps:escape' &
setxkbmap -layout us,am -variant ,phonetic-alt -option 'grp:alt_shift_toggle,caps:escape' &

# keyboard delay and repeat rates
xset r rate 220 80

# Disable pc speaker beep
xset b off

# Screen powersave after 60 seconds
#xset +dpms
#xset dpms 0 0 60

# Lock screen after <time> minutes
#xautolock -time 1 -locker slock &

# Start eclim daemon
#/usr/share/eclipse/eclimd &

# Numlock on
numlockx &

# Load styles
xrdb ~/.Xresources

# Connect to wifi
#connmanctl connect wifi_08edb94aa1ed_616363657373706f696e74_managed_psk &

# Clipboard sync
parcellite &

# Screenshot tool
shutter --min_at_startup &

exec i3

