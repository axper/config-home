nnoremap <buffer> <F5> :w<CR>:!build-execute<CR>
nnoremap <buffer> <F6> :w<CR>:!clang++ -ggdb -pthread -std=c++11 % -o %:r.out<CR>:!objdump --demangle -d -M intel-mnemonic --no-show-raw-insn -j .text %:r.out >> %:r.objd<CR>:badd %:r.objd<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-completers/cpp.py'
