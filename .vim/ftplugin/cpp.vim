map <F5> :w<CR>:!clang++ -ggdb -pthread -std=c++11 % -o %:r.out && ./%:r.out<CR>

