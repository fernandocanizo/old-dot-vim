" vim comments
set comments="b:\""

set textwidth=110

" use tabs, not spaces, worth 4 spaces
set tabstop=4
set shiftwidth=4
set noexpandtab

" F1 comment line
imap <F1> <esc>0i"<esc>j
map <F1> 0i"<esc>j

" F2 uncomment line
map <F2> :s/^"//e<return>:noh<return>j
imap <F2> <esc>:s/^"//e<return>:noh<return>j

" F3 structured comment
map <F3> <esc>o"<esc>a=<esc>64.<esc>yypO" 
