
set omnifunc=csscomplete#CompleteCSS

set textwidth=130
set nowrap

" use TAB character when TAb is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent when indenting with >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set smartindent
set smartcase
set noincsearch

" F1 comment line
map <F1> 0i/*<esc>A*/<esc>j
imap <F1> <esc>0i/*<esc>A*/<esc>j

" F2 uncomment line
map <F2> :s/\/\*//<enter>:s/\*\///<enter>:noh<enter>j
imap <F2> <esc>:s/\/\*//<enter>:s/\*\///<enter>:noh<enter>j

" F4 header
map <F4> <esc>1GO/*<return> * Creation Date: <esc>:r! LC_TIME=us date "+\%Y.\%m.\%d"<return><esc><esc>kJo* Author: Fernando L. Canizo - http://flc.muriandre.com/<return>*/<esc>o<return>
