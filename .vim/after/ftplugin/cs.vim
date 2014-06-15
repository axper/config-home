nnoremap <buffer> <F5> :w<CR>:!mcs % -out:%:r.out && ./%:r.out<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-completers/cs.py'
