" F1 comment line
map <F1> 0i; <esc>j
imap <F1> <esc>0i; <esc>j

" F2 uncomment line
map <F2> :s/\v^;[ ]*//<enter>j
imap <esc><F2> :s/\v^;[ ]*//<enter>j

" F3 structured comment with documentation patterns
map <F3> o;; @syntax <return>;; @param <return>;; @return <return>;; @example<return><esc>
imap <F3> <esc>o;; @syntax <return>;; @param <return>;; @return <return>;; @example<return><esc>

" F4 header
map <F4> gg0O#!/usr/bin/env newlisp<enter>;; Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc>kJo;; @author Fernando L. Canizo - http://flc.muriandre.com/<return>;; @module<return>;; @description<return>;; @version 0<esc>o

" http://www.gnu.org/licenses/gpl-3.0.txt

" toggle red coloring, lisp convention is for spaces, and it's annoying to read other people's code all in red
map <F6> :call SpaceHighlightorOff()<enter>

" use TAB character when TAb is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent with >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

set textwidth=165

" TODO see if I can make it puts tabs, it insist in putting 3 spaces
set noautoindent

" ugly! it puts just one space
set nocindent

" doesn't recognize all paterns but behaves more predictable
set smartindent

set smartcase
set noincsearch

call SpaceHighlightor()
