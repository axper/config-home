###### Zsh settings ######
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
setopt nomatch
#setopt completealiases
unsetopt appendhistory autocd beep extendedglob notify
bindkey -v
zstyle :compinstall filename '/home/void/.zshrc'
autoload -Uz compinit
compinit


###### Environtment vars ######
# see .xinitrc

###### Aliases ######
# pacman
alias pacs='pacman -Ss'
#alias pacu='sudo pacman -Syu'
alias pacu='sudo pacman -Sy linux-headers && sudo pacman -Su'
alias pac='sudo pacman -S'
alias pacql='pacman -Ql'
alias pacqs='pacman -Qs'
alias pacr='sudo pacman -R'
alias pacqm='pacman -Qm'
alias pacqo='pacman -Qo'
alias pacqi='pacman -Qi'
alias pacqs='pacman -Qs'
# ls
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -lAh --group-directories-first'
# other
alias grep='grep --color=auto'
alias v='gvim'
alias p='ps -ux'
# Write command history, as typing 'S' in ranger erases it
alias ra='fc -W && ranger'
alias pwgen='pwgen -yc'
alias s='sudo '
alias sv='sudo -E gvim '
alias sudo='sudo '
alias cal='cal -m'
alias updatedb='sudo updatedb'
alias d='xterm -e "cd $PWD; zsh" &'
alias y='yaourt'
alias k='kill -SIGTERM'
alias kk='kill -SIGKILL'
alias reboot='sudo reboot'
alias cls='reset -Q'
alias reset='reset -Q'
alias rsync='rsync -h --progress'
alias c='systemctl'
alias sc='sudo systemctl'
# Skype - also see .scripts
alias skype='xhost +local: && sudo -u skype /usr/bin/skype'
alias gdb='gdb -quiet' # disable startup message
alias u='udiskie-umount'


###### Colored man pages ######
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


###### Prompt style ######
autoload -U colors && colors
PROMPT="%{$fg_bold[green]%}%~ $ %{$reset_color%}"


###### Terminal title ######
# From https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
#      vcs_info
      print -Pn "\e]0;[%~]\a"
    }
    preexec () { print -Pn "\e]0;[%~] ($1)\a" }
    ;;
esac


###### Disown jobs that end with & ######
precmd_disown() {
  emulate -L zsh
  setopt extendedglob
  local job match mbegin mend

  jobs | while read job; do
    if [[ $job = \[(#b)([[:digit:]]##)\]*running* ]]; then
      disown %$match[1]
    fi
  done
}
autoload -U add-zsh-hook
add-zsh-hook precmd precmd_disown


###### Command not found ######
source /usr/share/doc/pkgfile/command-not-found.zsh


###### Xterm tab width ######
env TERM=linux setterm -regtabs 4


###### Less color (requires source-highlight) ######
#export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
#export LESS='-R '
