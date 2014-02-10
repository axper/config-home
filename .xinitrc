#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Environment vars
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR=gvim
export VISUAL=vim
export PAGER=less
export PATH=$PATH:~/.scripts/:~/.scripts-games
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '
export LANG=en_US.utf8
export TERM=xterm
export TERMCMD=xterm
export BROWSER=firefox
export MANPATH=/usr/share/man
export WINEARCH=win32
export DISPLAY=":0.0"  # for skype
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export CCACHE_DIR=/media/storage/temp/ccache
export SDL_VIDEO_FULLSCREEN_HEAD=1
unset _JAVA_OPTIONS
unset SSH_ASKPASS # Disables gui in git when asking for password

# Reload .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disk automounter
udiskie &

# Keyboard layouts & disable caps lock
#setxkbmap -layout us,am,ru -variant ,phonetic-alt,phonetic -option 'grp:alt_space_toggle,caps:escape' &
setxkbmap -layout us,am -variant ,phonetic-alt -option 'grp:alt_space_toggle,caps:escape' &

# keyboard delay and repeat rates
xset r rate 240 60

# Disable pc speaker beep
xset b off

# Screen powersave after 60 seconds
#xset +dpms
#xset dpms 0 0 60

# Lock screen after <time> minutes
xautolock -time 1 -locker slock &

exec i3

