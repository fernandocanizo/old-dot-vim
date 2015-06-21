" use TAB character for indenting
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent with >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=0
set autoindent
" don't wrap lines
set nowrap

" don't start from the beginning when searchin
set nowrapscan

set smartcase
set noincsearch

set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://

" to use make inside vim: save errors on "error" file
" move between errors with :cnext / :cprevious
set makeef=error

set noautowrite
set nobackup

" F1 comment line
map <F1> 0i/* $a */j
imap <F1> 0i/* $a */j

" F2 uncomment line
map <F2> 03x$xxxj
imap <F2> 03x$xxxj

" F3 structured comment
map <F3> o/a*58.yyp0xA/ko
imap <F3> o/a*58.yyp0xA/ko

map <F4> <esc>1GO/*<enter> Creation Date: <esc>:r! LC_TIME=us date "+\%Y.\%m.\%d"<return><esc>kJoAuthor: Fernando L. Canizo - http://flc.muriandre.com/<return><esc>a/<esc>o


" F9 compile
map <F9> :!gcc -Wall -c -g -ansi -pedantic % 2>error; less error

" F10 compile and execute
" TODO try to map this to CTRL-F9
map <F10> :!gcc -Wall -g -ansi -pedantic % -orunme ; ./runme > see 2> error; less see error

" F11 compile and call gdb
map <F11> :!gcc -Wall -g -ansi -pedantic % -o debugme 2>error; gdb debugme

" common code snippets
abbreviate main int main() {return(0);}<esc>
abbreviate stdio #include <stdio.h>

call SpaceHighlightor()
