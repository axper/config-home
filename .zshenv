# Environment variables
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR=gvim
export VISUAL=vim
export PAGER=less
export PATH=$PATH:~/.scripts/:~/.scripts-games
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '
export LANG=en_US.utf8
export BROWSER=firefox
export MANPATH=/usr/share/man
export WINEARCH=win32
export DISPLAY=":0.0"  # for skype
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
#export SDL_VIDEO_FULLSCREEN_HEAD=1
#unset _JAVA_OPTIONS
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export HISTSIZE=1000000
unset SSH_ASKPASS # Disables gui in git when asking for password
#export JETTY_BASE=/home/babken/tmp/jetty-base
#export JETTY_HOME=/usr/share/jetty
export WL_HOME="/home/babken/Oracle/Middleware/wlserver_10.3"

