" F1 comment line
map <F1> 0i//<esc>j
imap <F1> <esc>0i//<esc>j

" F2 uncomment line
map <F2> :s/^\/\///e<return>:noh<return>j
imap <F2> <esc>:s/^\/\///e<return>:noh<return>j

" F3 structured comment
map <F3> o<esc>i/<esc>79.yyp0O//<space>
imap <F3> <esc>o<esc>i/<esc>79.yyp0O/<space>

" F4 header
map <F4> <esc>1GO<?php<return>// Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc><esc>kJo// Author: Fernando L. Canizo - http://flc.muriandre.com/<return>

" use TAB character when TAb is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces when indenting with >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=0
set autoindent
set wrap
set nowrapscan
set smartcase

set omnifunc=phpcomplete#CompletePHP

call SpaceHighlightor()
