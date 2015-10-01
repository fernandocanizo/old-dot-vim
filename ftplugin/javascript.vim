" ftplugin/javascript.vim

" intelligent autocompleter
set omnifunc=javascriptcomplete#CompleteJS

" F1 comment line
map <Leader>1 0i//<esc>0j
imap <Leader>1 <esc>0i//<esc>0j

" F2 uncomment line
map <Leader>2 :s/^\/\///e<return>:noh<return>j

" F3 structured comment
map <Leader>3 o<esc>i/<esc>79.yyp0O//<space>
imap <Leader>3 <esc>o<esc>i/<esc>79.yyp0O//<space>

" F4 file header
map <Leader>4 <esc>1GO// Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc>kJo<esc>0xxo<return><esc>kO"use strict";<esc>Gi

" use TAB character when TAB is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent (>>, endfunction
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=0

set smartindent

" TODO it would be nice to have this when on a comment, but it's not cool for code
set nowrap
set smartcase

colorscheme conanperlgray

" highlight unwanted spaces
call SpaceHighlightor()
