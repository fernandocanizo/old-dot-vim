" ftplugin/javascript.vim

" intelligent autocompleter
set omnifunc=javascriptcomplete#CompleteJS

" F1 comment line
map <F1> 0i//<esc>j
imap <F1> <esc>0i//<esc>j

" F2 uncomment line
map <F2> :s/^\/\///e<return>:noh<return>j

" F3 structured comment
map <F3> o<esc>i/<esc>79.yyp0O//<space>
imap <F3> <esc>o<esc>i/<esc>79.yyp0O//<space>

" F4 file header
map <F4> <esc>1GO'use strict';<esc>o<esc>

" use TAB character when TAB is pressed
set expandtab

" number of spaces to show for a TAB
set tabstop=2

" number of spaces for indent (>>, endfunction
set shiftwidth=2

" number of spaces for a tab in editing operations
set softtabstop=2

set textwidth=0

set smartindent

" TODO it would be nice to have this when on a comment, but it's not cool for code
set nowrap
set smartcase

set number
colorscheme conanperlgray

" highlight unwanted spaces
call SpaceHighlightor()
