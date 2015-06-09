" Author: Fernando L. Canizo - http://flc.muriandre.com/


set nocompatible " Use Vim defaults (much better!)
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
	" Keep Plugin commands between vundle#begin/end.

	" YouCompleteMe is a little bit stupid on Javascript, but with tern_for_vim it becomes awesome
	" (says oli.me.uk but I don't have it working yet)
	" 2015.05.30 not very happy with it, uses >250 MB RAM, need to find an option
	Plugin 'Valloric/YouCompleteMe'

	" use it by calling :Tern<tab>
	" for example TernDef will tell you the link on mozilla developer website
	Plugin 'https://github.com/marijnh/tern_for_vim.git'

	Plugin 'SirVer/ultisnips'

	" Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any
	" resulting errors to the user
	Plugin 'Syntastic'

	" OMNI Completion based on the current syntax highlights
	Plugin 'SyntaxComplete'

	" syntax support for popular javascript libraries
	Plugin 'https://github.com/othree/javascript-libraries-syntax.vim.git'

	" lean & mean status/tabline for vim that's light as air
	Plugin 'https://github.com/bling/vim-airline.git'

	" to show difference on files already in git repo
	Plugin 'https://github.com/airblade/vim-gitgutter.git'

	" quoting/parenthesizing made simple
	Plugin 'https://github.com/tpope/vim-surround.git'

	" Git wrapper, use it with :G<tab>
	Plugin 'https://github.com/tpope/vim-fugitive.git'

	" pressing ga on a character reveals its representation in decimal, octal, and hex. Characterize.vim
	" modernizes this with the following additions:
	" Unicode character names: U+00A9 COPYRIGHT SYMBOL
	" Vim digraphs (type after <C-K> to insert the character): Co, cO
	" Emoji codes: :copyright:
	" HTML entities: &copy;
	Plugin 'https://github.com/tpope/vim-characterize.git'

	Plugin 'https://github.com/tpope/vim-jdaddy.git'

	" 2015.03.06 syntax for Mustache and Handlebars templates
	Plugin 'mustache/vim-mustache-handlebars'

	Plugin 'https://github.com/majutsushi/tagbar'

call vundle#end()

" Syntastic configuration
" use tidy-html5
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'


" javascript-libraries-syntax configuration as I don't use all the libraries it provides syntax for
let g:used_javascript_libs = 'jquery,underscore,backbone,handlebars'


" airline: Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" airline: Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" detect file types, autoload associated plugin and indent file for detected file type
" required by Vundle
filetype plugin indent on

" SirVer/ultisnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" This didn't work
let g:UltiSnipsExpandTrigger = '<F12>'
let g:UltiSnipsListSnippets = '<C-F12>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"ultisnips configuration ends


" Syntastic plugin configuration
" recommended for new users of Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic configuration ends


" SyntaxComplete configuration
" setup SyntaxComplete for every filetype that does not already have a language specific OMNI script
filetype plugin on
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

" beautiful colors please
set t_Co=256

" Set terminal encoding equal to actual encoding if empty
if &tenc == ""
	let &tenc = &enc
endif


" some coloring brought from conanperlgray

" Console
set cul " highlight current line

" change status line based on mode
if version >= 700
	au InsertEnter * hi StatusLine ctermbg=black ctermfg=green
	au InsertLeave * hi StatusLine ctermbg=white ctermfg=blue
endif

" always show status line
set laststatus=2
set statusline=[LINE=%l]\ [COL=%v]\ %f%m%r%h%w\ [FORMAT=%{&ff}]\ [FILETYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%p%%]\ [LINES=%L]

" don't wrap around file on searches
set nowrapscan

" show xterm title
set title

" do not scroll as I type, it's annoying
set noincsearch

" allow backspacing over everything in insert mode
set bs=2

" don't keep a backup file
set nobackup

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" I change this for source code files
set textwidth=0
set noautoindent

" this doesn't change the text, only hoy it's displayed
set wrap

" ignore case in searches
set ignorecase

" better and nice command-line completion
set wildmenu

" Number of spaces to show for a tab (i.e. for display purposes, doesn't
" actually change the contents of the file). Note that if shiftwidth is
" not the same as tabstop, vim will use spaces to make up the
" difference when indenting with the >> and == indentation commands.
set shiftwidth=4
set tabstop=4
set noexpandtab " Use tabs, not spaces

" no annoying sounds or visual flashes
set noerrorbells
set visualbell

set formatoptions=tcq2

" Place only a single space between sentences when joinging lines.
set nojoinspaces

" highlight searches
set hlsearch

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	" Background must be set for syntax on to have an effect
	set background=dark
	colorscheme conanperlgray
    syntax on
endif


" start with no search highlightsng
set nohls

" allow me to switch to another buffer even if I haven't written my changes
set hidden


" Mappings

" explicitly set mapleader to \
let mapleader = "\\"

" tab creation/navigation
" new tab ctrl-t
map <c-t> <esc>:tabnew<return>
" switch to left or right ctrl-h ctrl-l
map <c-h> :tabprevious<return>
map <c-l> :tabnext<return>


" scroll up/down one line keeping current position
map <C-j> <C-e>j
map <C-k> <C-y>k


" reformat to end of paragraph
map Q gq}

" less-like behaviour
nmap <space> <PageDown>
nmap <backspace> <PageUp>


" quit and macro recording
nnoremap <Leader>r q
nmap q :q<enter>


" Indenting
vmap <tab> >>
vmap <S-tab> <<


" regexp: cannot set very magic permanently, so this mappings are a work around, they set very magic
" also I set hls everytime I search
" TODO modify next one to not put an \v after every other forward slash
nnoremap / :set hls<enter>/\v
nnoremap ? :set hls<enter>?\v
nnoremap # :set hls<enter>#\v
nnoremap * :set hls<enter>*\v
cnoremap s/ s/\v

" F1 shell-like line commenting
map <F1> 0i#<esc>j
imap <F1> <esc>0i#<esc>j

" F2 shell-like line uncommenting
map <F2> :s/^#//e<return>:noh<return>j
imap <F2> <esc>:s/^#//e<return>:noh<return>j

" line separator
map <F3> o<esc>a—<esc>168.
imap <F3> <esc>0a—<esc>168.o

set pastetoggle=<F5>

" toggle cursor line highlighting
map <F6> :set cursorline!<enter>:set cursorline?<enter>

" toggle search highlighting
map <F7> :set hls!<enter>:set hls?<enter>

" insert date in RFC 2822 format
map <F8> <esc>:r !date<enter>kJ$
imap <F8> <esc>:r !date<enter>A<space>

" shift+insert copies from XA_PRIMARY (mouse selection)
" this mapping copies from XA_SECONDARY (clipboard)
" equivalent to CTRL-V in other editors
map <Leader>p "+gP


" by albertito@lugfi: hl in red spaces after text on EOL
highlight WhiteSpaceEOL ctermbg=red guibg=red
match WhiteSpaceEOL /\v\s+$/


" mark any tabs that are not at the beginning of the line (indentation) as an error:
match errorMsg /[^\t]\zs\t\+/


" Filetype stuff

" jump to last position we were editing on this file
autocmd BufReadPost * if line("'\"") | exe "'\"" | endif


" Open files completely unfolded
au BufRead * normal zR

au! FileType json call MapeosJson()

" No existe el filetype text, so I create it
au! BufRead,BufNewFile *.txt set filetype=text
au! FileType text call MapeosTXT()

au! BufRead,BufNewFile *.ctodo set filetype=ctodo
au! FileType ctodo call MapeosConanTodo()

" Create a new filetype for fish shell scripts
au! BufRead,BufNewFile *.fish set filetype=fish
" And the entry to read the syntax file is needed too
au! Syntax fish source $HOME/.vim/syntax/fish.vim

au! FileType sh call MapeosShell()

au! FileType man call MapeosMan()

au! FileType mail call MapeosMail()

au! FileType vim call MapeosVimRC()

au! FileType python call MapeosPython()

au! FileType perl call MapeosPerl()

au! FileType html call MapeosHTML()

au! FileType xhtml call MapeosHTML()

au! FileType css call MapeosCSS()

au! FileType lisp call MapeosLisp()

au! BufRead,BufNewFile *.nl call MapeosNewlisp()

au! FileType php call MapeosPHP()

au! FileType javascript call MapeosJavaScript()

au! FileType lua call MapeosLua()

au! FileType sql call MapeosSQL()

au! Filetype ruby call MapeosRuby()
au! Filetype eruby call MapeosRuby()

au! Filetype clojure call Clojure()

au! FileType gitodo call GitodoMaps()

augroup cprog
	" When starting to edit a file:
	"   For C and C++ files set formatting of comments and set C-indenting on.
	"   For other files switch it off.
	"   Don't change the order, it's important that the line with * comes first.
	autocmd FileType * set formatoptions=tcql2 nocindent comments&
	autocmd FileType c,cpp  call MapeosC()
	autocmd BufNewFile,BufRead *.h call MapeosC()
augroup end

augroup gzip
	" Enable editing of gzipped files
	"     read: set binary mode before reading the file
	"       uncompress text in buffer after reading
	"    write: compress file after writing
	"   append: uncompress file, append, compress file
	autocmd BufReadPre,FileReadPre  *.gz set bin
	autocmd BufReadPost,FileReadPost    *.gz let ch_save = &ch|set ch=2
	autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
	autocmd BufReadPost,FileReadPost    *.gz set nobin
	autocmd BufReadPost,FileReadPost    *.gz let &ch = ch_save|unlet ch_save
	autocmd BufReadPost,FileReadPost    *.gz execute ":doautocmd BufReadPost " . expand("%:r")

	autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
	autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

	autocmd FileAppendPre           *.gz !gunzip <afile>
	autocmd FileAppendPre           *.gz !mv <afile>:r <afile>
	autocmd FileAppendPost      *.gz !mv <afile> <afile>:r
	autocmd FileAppendPost      *.gz !gzip <afile>:r
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Funciones

" TODO: revisar el resto de las funciones de mapeo y setear: textwidth, indenting, wrapping y F1 y F2

function MapeosShell()
	" F1 comentar lineas
    map <F1> 0i#<esc>j
    imap <F1> <esc>0i#<esc>j

    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^#//e<return>:noh<return>j
    imap <F2> <esc>:s/^#//e<return>:noh<return>j

    " F3 separador
    map <F3> o<esc>i#<esc>a-<esc>78.
    imap <F3> <esc>o<esc>i#<esc>a-<esc>78.

	" F4 cabecera
	map <F4> ggO#!/bin/bash<enter># Creation date:<esc>:r !date "+\%Y.\%m.\%d"<enter>kJo# by Fernando L. Canizo - http://flc.muriandre.com/<enter><enter># exit if any statement returns false value (can't use $? from now on)<enter>set -o errexit<enter># exit if variable not set<enter>set -o nounset<enter># uncomment to debug<enter>#set -x<enter>

	imap <F4> <esc>ggO#!/bin/bash<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter># exit if any statement returns false value (can't use $? from now on)<enter>set -o errexit<enter># exit if variable not set<enter>set -o nounset<enter># uncomment to debug<enter>#set -x<enter>

	set textwidth=0
endfunction " MapeosShell


function MapeosMan()
	map <space> [6~
endfunction

function MapeosMail()
    " borra desde la posicion actual hasta el principio
    " FIX: anular mensajes de confirmación para este mapeo
    map <F1> :.,1d<enter>
    " Borra desde linea actual (incluida) hasta la firma y nos deja en modo
    " edición
    map <F2> 0maG?^--<Enter>kd'a:noh<enter>O
    set textwidth=70
endfunction

function MapeosVimRC()
    " para cuando edito este archivo
    " comentarios a lo vim
    " FIX: no está funcionando!
    set comments="b:\""
    set textwidth=110
    set tabstop=4
    set shiftwidth=4
    set noexpandtab
    " mapear F1 para que comente una linea existente
    imap <F1> <esc>0i"<esc>j
    map <F1> 0i"<esc>j
	" F2 descomenta
    map <F2> :s/^"//e<return>:noh<return>j
    imap <F2> <esc>:s/^"//e<return>:noh<return>j
    " mapear <F3> para que cree un comentario estructurado
    map <F3> <esc>o"<esc>a=<esc>64.<esc>yypO" 
endfunction

function MapeosPython()
	" Configuración del autocompletado inteligente (el de Python necesita un Vim
	" compilado contra las librerías de Python para funcionar)
	set omnifunc=pythoncomplete#Complete

    " F1 comentar lineas
    map <F1> 0i#<esc>j
    imap <F1> <esc>0i#<esc>j
    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^#//e<return>:noh<return>j
    imap <F2> <esc>:s/^#//e<return>:noh<return>j
    " F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i#<esc>79.yyp0O#<space>
    imap <F3> <esc>o<esc>i#<esc>79.yyp0O# 
    " shift-F3 comentario para separar menos llamativo
    map [25~ o#<esc>a-<esc>78.j
    " F4 insertar datos
    map <F4> <esc>1GO#! /usr/bin/env python<return># -*- coding: utf8 -*-<return># Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo# Author: Fernando L. Canizo - http://flc.muriandre.com/<esc>o<esc>

    set noexpandtab " use TAB character when TAB is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

	syntax on
	set background=dark
	autocmd BufRead *.py set smartindent
"	cinwords=if,elif,else,for,while,try,except,finally,def,class

    set textwidth=0
    set autoindent
    " sería copado ponerlos de nuevo al comentar
    set nowrap
    " recomience búsqueda desde el ppio. si es necesario
    set wrapscan
    " uso color cyan para los comentarios
    "hi Comment ctermfg=11

	call SpaceHighlightor()
endfunction


function MapeosPerl()
	" F1 comentar lineas
    map <F1> 0i#<esc>j
    imap <F1> <esc>0i#<esc>j

    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^#//e<return>:noh<return>j
    imap <F2> <esc>:s/^#//e<return>:noh<return>j

    " F3 comentario
    map <F3> o<esc>i#<esc>a#<esc>148.<esc>yypO# 
    imap <F3> <esc>o<esc>i#<esc>a#<esc>148.<esc>yypO# 

	" F4 cabecera
	map <F4> ggO#!/usr/bin/env perl<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>use warnings;<enter>use strict;<enter>use 5.12.2;<enter><enter>
	imap <F4> <esc>ggO#!/usr/bin/env perl<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>use warnings;<enter>use strict;<enter>use 5.12.2;<enter><enter>

    "
    set textwidth=0 " no corte lineas
    set cindent
    " sería copado ponerlos de nuevo al comentar
    set nowrap

	colorscheme conanperlgray
endfunction


function MapeosC()
    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations
    set textwidth=0
	set autoindent
    set nowrap " don't wrap lines
    set wrapscan
	set smartcase
    set noincsearch

	set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    " para make desde dentro de vim
    " guarde los errores en este archivo: luego uno se mueve con :cnext
    " :cprevious
    set makeef=error

    " evita que el editor se queje cda vez que se ejecuta un comando de shell
    " útil para compilar
    set autowrite
    set nobackup " no need for backup, I have git

    " F1 comentar lineas
    map <F1> 0i/* $a */j
    imap <F1> 0i/* $a */j

	" F2 descomentar lo que F2 ha comentado: no sirve para comentarios genéricos
	map <F2> 03x$xxxj
    imap <F2> 03x$xxxj

    " estaria bueno tener F3 para descomentar. O mejor aun: que F2 comente o
    " descomente dependiendo de lo que vea

    " F3 comentario estructurado para comentarios largos
    map <F3> o/a*58.yyp0xA/ko
    imap <F3> o/a*58.yyp0xA/ko

    map <F4> <esc>1GO/*<enter> Creation Date: <esc>:r! LC_TIME=us date "+\%Y.\%m.\%d"<return><esc>kJoAuthor: Fernando L. Canizo - http://flc.muriandre.com/<return><esc>a/<esc>o

    " <F5>, <F6>, <F7> ya se han usado

    " F9 compilar
    map <F9> :!gcc -Wall -c -g -ansi -pedantic % 2>error; less error

    " F10 compilar y ejecutar, ver resultados con less
    " (lo hice con F10 porque no pude mapear CTRL-F9)
    map <F10> :!gcc -Wall -g -ansi -pedantic % -orunme ; ./runme > see 2> error; less see error

    " F11 compilar y llamar a gdb
    map <F11> :!gcc -Wall -g -ansi -pedantic % -o debugme 2>error; gdb debugme

	" common code snippets
	abbreviate main int main() {return(0);}<esc>
	abbreviate stdio #include <stdio.h>

	set omnifunc=phpcomplete#CompletePHP
	call SpaceHighlightor()
endfunction

function MapeosPHP()
    " F1 comentar lineas
    map <F1> 0i//<esc>j
    imap <F1> <esc>0i//<esc>j

    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^\/\///e<return>:noh<return>j
    imap <F2> <esc>:s/^\/\///e<return>:noh<return>j

    " F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i/<esc>79.yyp0O//<space>
    imap <F3> <esc>o<esc>i/<esc>79.yyp0O/<space>

    " F4 insertar datos
    map <F4> <esc>1GO<?php<return>// Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc><esc>kJo// Author: Fernando L. Canizo - http://flc.muriandre.com/<return>
	
    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations
    set textwidth=0
"	set nosmartindent
	set autoindent
    set wrap
    set nowrapscan
	set smartcase

	set omnifunc=phpcomplete#CompletePHP

	call SpaceHighlightor()
endfunction

function MapeosJavaScript()
	" Configuración del autocompletado inteligente
	set omnifunc=javascriptcomplete#CompleteJS

	" F1 comentar lineas
	map <F1> 0i//<esc>j
	imap <F1> <esc>0i//<esc>j
	" F2 descomentar lineas solo si tienen // al comienzo
	map <F2> :s/^\/\///e<return>:noh<return>j

	" F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i/<esc>79.yyp0O//<space>
    imap <F3> <esc>o<esc>i/<esc>79.yyp0O//<space>
    " F4 insertar datos
    map <F4> <esc>1GO// Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc><esc>kJo// Author: Fernando L. Canizo - http://flc.muriandre.com/<esc>o<esc>0xxo<return><esc>kO"use strict";<enter><enter>

    set noexpandtab " use TAB character when TAB is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

    set textwidth=0
	set smartindent
    " sería copado ponerlos de nuevo al comentar
    set nowrap
	set smartcase
    " uso color cyan para los comentarios
    "hi Comment ctermfg=11
    colorscheme conanperlgray

	call SpaceHighlightor()
endfunction

" mapeos para editar confortablemente HTML
function MapeosHTML()
	" Configuración del autocompletado inteligente
	" set omnifunc=htmlcomplete#CompleteTags

	set textwidth=150

    set autoindent
	set nosmartindent

    set noexpandtab " use TAB character when TAB is pressed
    set tabstop=3 " number of spaces to show for a TAB
	set shiftwidth=3 " number of spaces for indent (>>, endfunction
	set softtabstop=3 " number of spaces for a tab in editing operations

	" F1: comenta la linea actual
	map <F1> I<!-- A -->j
	" F2: quita comentario
	map <F2> :s/\v^(\s*)\<!-- (.+)\s*--\>/\1\2/<enter>
	" F3: crea comentario, te deja en modo inserción
	map <F3> i<!--   -->k5li

	" html5 template
	map <F4> gg:r /home/conan/csoft/library/html/html.5.simple.html<enter>ggdd
endfunction " MapeosHTML()

function MapeosCSS()
	" Configuración del autocompletado inteligente
	set omnifunc=csscomplete#CompleteCSS

	set textwidth=130
	set nowrap

    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

	set smartindent
	set smartcase
    set noincsearch

	" F1: comenta la linea actual
	map <F1> 0i/*<esc>A*/<esc>j
	imap <F1> <esc>0i/*<esc>A*/<esc>j
	" F2 descomenta
	map <F2> :s/\/\*//<enter>:s/\*\///<enter>:noh<enter>j
	imap <F2> <esc>:s/\/\*//<enter>:s/\*\///<enter>:noh<enter>j

    " F4 insertar datos
    map <F4> <esc>1GO/*<return> * Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo* Author: Fernando Canizo (aka conan) - http://conan.muriandre.com/<return>*/<esc>o<return>

endfunction

function MapeosLisp()
	" F1: comenta la linea actual
	map <f1> 0i; <esc>j
	imap <f1> <esc>0i; <esc>j

	" F2 descomenta
	map <f2> :s/^; //<enter>j
	imap <esc><f2> :s/^; //<enter>j

	" F3 comentario estructurado
    map <F3> o<esc>i;<esc>79.yyp0O;;<space>
    imap <F3> <esc>o<esc>i;<esc>79.yyp0O;;<space>
    
	" shift-F3 comentario para separar menos llamativo
    map [25~ o#<esc>a-<esc>78.j
    
	" F4 insertar datos
    map <F4> <esc>1GO; Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo; Author: Fernando Canizo (aka conan) - http://conan.muriandre.com/<return><esc>o

	" toggle red coloring, lisp convention is for spaces, and it's annoying to read other people's code all in red
	map <F6> :call SpaceHighlightorOff()<enter>

    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

    set textwidth=165
	
	set noautoindent " it puts 3 spaces instead of tabs
	set smartindent " doesn't recognize all paterns but behaves more predictable
	set nocindent " ugly! it puts just one space
	set smartcase
    set noincsearch


	call SpaceHighlightor()

    " sería copado que wrapee al comentar, pero no cuando escribo código
"    set nowrap
endfunction


function MapeosNewlisp()
	" F1: comenta la linea actual
	map <F1> 0i; <esc>j
	imap <F1> <esc>0i; <esc>j

	" F2 descomenta
	map <F2> :s/\v^;[ ]*//<enter>j
	imap <esc><F2> :s/\v^;[ ]*//<enter>j

	" F3 comentario para generar autodocumentación para funciones
    map <F3> o;; @syntax <return>;; @param <return>;; @return <return>;; @example<return><esc>
    imap <F3> <esc>o;; @syntax <return>;; @param <return>;; @return <return>;; @example<return><esc>
    
	" F4 insertar datos
    map <F4> gg0O#!/usr/bin/env newlisp<enter>;; Creation Date: <esc>:r! date "+\%Y.\%m.\%d"<return><esc>kJo;; @author Fernando L. Canizo - http://flc.muriandre.com/<return>;; @module<return>;; @description<return>;; @version 0<esc>o

	" http://www.gnu.org/licenses/gpl-3.0.txt

	" toggle red coloring, lisp convention is for spaces, and it's annoying to read other people's code all in red
	map <F6> :call SpaceHighlightorOff()<enter>

    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

    set textwidth=165
	
	set noautoindent " it puts 3 spaces instead of tabs
	set smartindent " doesn't recognize all paterns but behaves more predictable
	set nocindent " ugly! it puts just one space
	set smartcase
    set noincsearch

	set filetype=newlisp

	call SpaceHighlightor()

    " sería copado que wrapee al comentar, pero no cuando escribo código
"    set nowrap
endfunction


function MapeosPicolisp()
    " F1 comentar lineas
    map <F1> 0i#<esc>j
    imap <F1> <esc>0i#<esc>j
    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^#//e<return>:noh<return>j
    imap <F2> <esc>:s/^#//e<return>:noh<return>j
    " F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i#<esc>79.yyp0O#<space>
    imap <F3> <esc>o<esc>i#<esc>79.yyp0O# 
    " shift-F3 comentario para separar menos llamativo
    map [25~ o#<esc>a-<esc>78.j
    " F4 insertar datos
    map <F4> <esc>1GO#! /home/conan/bin/picolisp /home/conan/lib/picolisp<return># -*- coding: utf8 -*-<return># Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJo# Author: Fernando Canizo (aka conan) - http://conan.muriandre.com/<return># This software is under GPL v2 license - http://www.gnu.org/licenses/gpl.txt<esc>o

    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=3 " number of spaces to show for a TAB
	set shiftwidth=3 " number of spaces for indent (>>, endfunction
	set softtabstop=3 " number of spaces for a tab in editing operations

    set textwidth=80
    " recomience búsqueda desde el ppio. si es necesario
    set wrapscan
    colorscheme elflord

	" por ahora asi, aunque debe haber un syntax file para picolisp en algun lado
	" set filetype=lisp
" no funco, me pone comentarios tipo lisp en vez del hash (#)
endfunction


function MapeosLua()
    " F1 comentar lineas
    map <F1> 0i--<esc>j
    imap <F1> <esc>0i--<esc>j
    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^--//e<return>:noh<return>j
    imap <F2> <esc>:s/^--//e<return>:noh<return>j
    " F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i-<esc>79.yyp0O/<space>
    imap <F3> <esc>o<esc>i-<esc>79.yyp0O/<space>
    " F4 insertar datos
    map <F4> <esc>1GO-- Creation Date: <esc>:r! LC_TIME=us date "+\%e \%b \%Y"<return><esc><esc>kJoAuthor: Fernando Canizo (akaconan) - http://conan.muriandre.com/<return> This software is under GPL v2 license - http://www.gnu.org/licenses/gpl.txt<esc>o<esc>0xxo<return><esc>kO

    set noexpandtab " use TAB character when TAb is pressed
    set tabstop=4 " number of spaces to show for a TAB
	set shiftwidth=4 " number of spaces for indent (>>, endfunction
	set softtabstop=4 " number of spaces for a tab in editing operations

    set textwidth=130
    set autoindent
    " sería copado ponerlos de nuevo al comentar
	set nowrap
    set wrapscan
	set smartcase
    " uso color cyan para los comentarios
    "hi Comment ctermfg=11
    colorscheme elflord

endfunction


" acronym abbreviation to work in my nanoblogger blog
function BlogAbbreviations()
	" they don't work if you press ENTER after the word, only with space (?)
	abbreviate p10n <acronym title="programming meeting">p10n</acronym>
	abbreviate p2p <acronym title="peer to peer">p2p</acronym> 
endfunction

" to edit subtitles for translation
function Subtitle()
	set textwidth=40
	set scrollbind
endfunction

function MapeosSQL()
"	source /usr/share/vim/autoload/dbext.vim
"	source /usr/share/vim/plugin/dbext.vim
	set textwidth=160

	" F1 comentar lineas
	map <F1> 0i-- <esc>j
	imap <F1> <esc>0i-- <esc>j
	" F2 descomentar lineas solo si tienen un # al comienzo
	map <F2> :s/^-- //e<return>:noh<return>j
	imap <F2> <esc>:s/^-- //e<return>:noh<return>j

    " F3 comentario estructurado (para definiciones de funciones and the like)
    map <F3> o<esc>i-- <esc>a#<esc>96.yyp0O--<space>
    imap <F3> <esc>o<esc>i-- <esc>a#<esc>96.yyp0O--<space>
    " F4 insertar datos
    map <F4> <esc>1GO-- Creation Date: <esc>:r! LC_TIME=us date -R<return><esc><esc>kJo-- Author: Fernando Canizo (aka conan) - http://conan.muriandre.com/<return>
endfunction

function MapeosTXT()
	set textwidth=80
	" estaría bueno tener spelling en un mapeo de teclas, pero es muy molesto tenerlo permanente para cualquier txt
"	set spell
"	set spelllang=en,es
endfunction

function MapeosRuby()
	" F1 comentar lineas
    map <F1> 0i#<esc>j
    imap <F1> <esc>0i#<esc>j

    " F2 descomentar lineas solo si tienen un # al comienzo
    map <F2> :s/^#//e<return>:noh<return>j
    imap <F2> <esc>:s/^#//e<return>:noh<return>j

    " F3 comentario
    map <F3> o<esc>i#<esc>a#<esc>148.<esc>yypO# 
    imap <F3> <esc>o<esc>i#<esc>a#<esc>148.<esc>yypO# 

	" F4 cabecera
	map <F4> ggO#!/usr/bin/env ruby<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>
	imap <F4> <esc>ggO#!/usr/bin/env ruby<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>

    set textwidth=0 " no corte lineas
    set cindent
    " sería copado ponerlos de nuevo al comentar
    set nowrap

	set shiftwidth=2 " Number of spaces to insert when indenting.
	set tabstop=2
	set softtabstop=2 " number of spaces for a tab in editing operations
	set noexpandtab " Use tabs, not spaces

	colorscheme conanperlgray
endfunction

function Clojure() " clojure mappings
	" required by vimclojure package
	syntax on
	filetype plugin indent on
	let vimclojure#WantNailgun = 1
	let vimclojure#NailgunClient = "ng"
	" to get the REPL run:
	" java -cp /usr/share/clojure/clojure.jar:/usr/share/clojure/clojure-contrib.jar:/usr/share/vimclojure/vimclojure.jar vimclojure.nailgun.NGServer 127.0.0.1

	" F1 comment line
    map <F1> 0i;<esc>j
    imap <F1> <esc>0i;<esc>j

    " F2 uncomment line only if has semicolon at the beginning
    map <F2> :s/^;//e<return>:noh<return>j
    imap <F2> <esc>:s/^;//e<return>:noh<return>j

    " F3 structured comment
    map <F3> o<esc>i;<esc>a;<esc>148.<esc>yypO; 
    imap <F3> <esc>o<esc>i;<esc>a;<esc>148.<esc>yypO; 

	" F4 cabecera
	map <F4> ggO;#!/usr/bin/env clj<enter>; Creation date:<esc>:r !date -R <enter>kJo; by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>
	imap <F4> <esc>ggO;#!/usr/bin/env clj<enter>; Creation date:<esc>:r !date -R <enter>kJo; by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter>

endfunction

function SpaceHighlightor()
	" by luca@lugfi: hl in red spaces at the beginning
	highlight SpaceError ctermbg=red
	match SpaceError /\v^( +|\t +)\S*/
	match SpaceError /\v\s+$/
endfunction

function SpaceHighlightorOff()
	" turn off all highlights from SpaceHighlightor
	match none
endfunction


function GitodoMaps()
	map <F4> gg0iwhat: <enter>when: <enter>prio: <enter>warn: <esc>ggA

endfunction

function MapeosConanTodo()
endfunction


function MapeosJson()
	" I create my package.json with 'npm init' command, which uses 2 spaces for indenting
	" so let's play nice with it

"	set shiftwidth=2 " Number of spaces to insert when indenting.
"	set tabstop=2
"	set softtabstop=2 " number of spaces for a tab in editing operations
"	set expandtab " use spaces

	" FUCK npm! I'll do :retab! each time
	set shiftwidth=4 " Number of spaces to insert when indenting.
	set tabstop=4
	set softtabstop=4 " number of spaces for a tab in editing operations
	set noexpandtab " don't use spaces
endfunction


" Notes on indenting
" Certain indenting options override others, this is the precedence list:
" indentexpr -> cindent -> smartindent -> autoindent
" where the -> indicates overriding, so indenexpr overrides any other setting
" That's why there's no point in putting more than one of these. However, sometimes, by concatenation of
" several rules you get more than one of these set, so it would be a reassuring practice,though I don't know
" if really needed, to unset the ones not used
