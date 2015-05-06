#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
[[ $XDG_VTNR -eq 1 ]] && exec startx
