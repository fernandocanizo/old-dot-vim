" F1 comment line
map <f1> 0i; <esc>j
imap <f1> <esc>0i; <esc>j

" F2 uncomment line
map <f2> :s/^; //<enter>j
imap <esc><f2> :s/^; //<enter>j

" F3 structured comment
map <F3> o<esc>i;<esc>79.yyp0O;;<space>
imap <F3> <esc>o<esc>i;<esc>79.yyp0O;;<space>

" Shift-F3 less flashy structured comment
map [25~ o#<esc>a-<esc>78.j

" F4 header
map <F4> <esc>1GO; Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo; Author: Fernando Canizo (aka conan) - http://conan.muriandre.com/<return><esc>o

" toggle spaces red coloring (useful when reading other people's code)
" lisp convention is for spaces, and it's annoying to read other people's code all in red
map <F6> :call SpaceHighlightorOff()<enter>

" use TAB character when TAb is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent when using >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=165

" TODO would be great to use it, but puts 3 spaces instead of tabs
set noautoindent

" ugly! it puts just one space
set nocindent

" doesn't recognize all paterns but behaves more predictable
set smartindent

set smartcase
set noincsearch

call SpaceHighlightor()
