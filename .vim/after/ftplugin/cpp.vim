map <F5> :w<CR>:!clang++ -ggdb -pthread -std=c++11 % -o %:r.out<CR>:!./%:r.out<CR>
let g:ycm_global_ycm_extra_conf = '/media/storage/projects/ycm-completers/cpp.py'

