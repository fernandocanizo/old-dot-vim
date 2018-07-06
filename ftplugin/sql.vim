" ftplugin/sql.vim

" intelligent autocompleter
"set omnifunc=javascriptcomplete#CompleteJS

" F1 comment line
"map <F1> 0i//<esc>j
"imap <F1> <esc>0i//<esc>j

" F2 uncomment line
"map <F2> :s/^\/\///e<return>:noh<return>j

" F3 structured comment
"map <F3> o<esc>i/<esc>79.yyp0O//<space>
"imap <F3> <esc>o<esc>i/<esc>79.yyp0O//<space>

" F4 file header
"map <F4> <esc>1GO'use strict';<esc>o<esc>

" use SPACES when TAB is pressed
set expandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent (>>, endfunction
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=140

set smartindent

set number
colorscheme conanperlgray

" highlight unwanted spaces
call SpaceHighlightor()
