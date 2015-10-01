set omnifunc=pythoncomplete#Complete

" F1 comment lines
map <Leader>1 0i#<esc>j
imap <Leader>1 <esc>0i#<esc>j

" F2 uncomment lines
map <Leader>2 :s/^#//e<return>:noh<return>j
imap <Leader>2 <esc>:s/^#//e<return>:noh<return>j

" F3 structured comment
map <Leader>3 o<esc>i#<esc>79.yyp0O#<space>
imap <Leader>3 <esc>o<esc>i#<esc>79.yyp0O#

" Shift-F3 less fancy structured comment
map <Shift><Leader>3 o#<esc>a-<esc>78.j

" F4 header
map <Leader>4 <esc>1GO#! /usr/bin/env python<return># -*- coding: utf8 -*-<return># Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo

" use TAB character
set expandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent (>>, endfunction
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

syntax on
set background=dark

autocmd BufRead *.py set smartindent
set autoindent

set textwidth=80

set nowrap
set nowrapscan

call SpaceHighlightor()
