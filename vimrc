" Author: Fernando L. Canizo - http://flc.muriandre.com/


set nocompatible " Use Vim defaults (much better!)
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" Keep Plugin commands between vundle#begin/end.

	" Let Vundle manage itself
	Plugin 'Vundlevim/Vundle.vim'

	Plugin 'https://github.com/ervandew/supertab'

	" Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any
	" resulting errors to the user
	Plugin 'Syntastic'

	" OMNI Completion based on the current syntax highlights
	Plugin 'SyntaxComplete'

	" Vastly improved Javascript indentation and syntax support in Vim
	Plugin 'https://github.com/pangloss/vim-javascript'

	" syntax support for popular javascript libraries
	Plugin 'https://github.com/othree/javascript-libraries-syntax.vim.git'

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
	"Plugin 'https://github.com/tpope/vim-characterize.git'

	" JSON manipulation and pretty printing
	"Plugin 'https://github.com/tpope/vim-jdaddy.git'
	Plugin 'https://github.com/elzr/vim-json'

	" 2015.03.06 syntax for Mustache and Handlebars templates
	Plugin 'mustache/vim-mustache-handlebars'

	Plugin 'https://github.com/ctrlpvim/ctrlp.vim'

	Plugin 'https://github.com/scrooloose/nerdtree'

	" Vertical lines to show indentation level
	Plugin 'https://github.com/Yggdroot/indentLine'

	" JSX syntax highlighting
	"Plugin 'https://github.com/mxw/vim-jsx'

	Plugin 'https://github.com/leafgarland/typescript-vim'

	" 2017.03.10
	Plugin 'https://github.com/tpope/vim-unimpaired'

	" 2017.10.24 EJS (embedded javascript syntax)
	Plugin 'nikvdp/ejs-syntax'

	" 2018.11.02 ALE Asynchronous Lint Engine: like Syntastic but as you type
	Plugin 'https://github.com/w0rp/ale'

call vundle#end()

" Disable double quotes concealing by elzr/vim-json plugin
let g:vim_json_syntax_conceal = 0

" Fucking indentLine script overwrites my settings for concealing (I don't like json double quotes concealing)
" Bring my quotes back!
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1


" Don't require files to have `.jsx` extension to be parsed as JSX
let g:jsx_ext_required = 0

" CTRLP ignore list
let g:ctrlp_custom_ignore = { 'dir': 'tmp\|node_modules\|DS_Store\|\.git' }

" NERDTree toggle key
map <Leader>t :NERDTreeToggle<enter>

" Syntastic configuration
" recommended for new users of Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" uncomment to debug Syntastic
"let g:syntastic_debug = 33
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" point *_exec to a valid binary (WTF?!) ->
" That's because *_exec has to point to an executable file before syntastic would consider enabling the checker
" This makes the linter work again, but it doesn't provide the error list, error list windows comes empty
let g:syntastic_javascript_eslint_exec = '/bin/true'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npx eslint '

" trying a different linter also doesn't work -> It won't work
" Syntastic needs a parser for the output of each linter, it needs to be aware of it
" Issue requesting lynt https://github.com/vim-syntastic/syntastic/issues/2228
"let g:syntastic_javascript_checkers = ['lynt']
"let g:syntastic_javascript_eslint_exe = 'npx lynt '

" use tidy-html5
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'
" Syntastic configuration ends

" javascript-libraries-syntax configuration as I don't use all the libraries it provides syntax for
let g:used_javascript_libs = 'jquery,underscore,backbone,handlebars'

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

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

set cryptmethod=blowfish2

" Mappings

" explicitly set mapleader to \
let mapleader = "\\"

" tab creation/navigation
" new tab ctrl-t
nmap <c-t> <esc>:tabnew<return>
" switch to left or right ctrl-h ctrl-l
nmap <Leader>h :tabprevious<return>
nmap <Leader>l :tabnext<return>


" buffer navigation
nmap <c-h> :bprevious<enter>
nmap <c-l> :bnext<enter>


" scroll up/down one line keeping current position
map <C-j> <C-e>j
map <C-k> <C-y>k


" reformat to end of paragraph
map Q gq}

" less-like behaviour
"nmap <space> <PageDown>
"nmap <backspace> <PageUp>


" quit and macro recording
nnoremap <Leader>r q
nmap q :q<enter>

" Indenting
vmap <tab> >>
vmap <S-tab> <<


" highlight searches
nnoremap / :set hls<enter>/\v
nnoremap ? :set hls<enter>?\v
nnoremap # :set hls<enter>#\v
nnoremap * :set hls<enter>*\v

" regexp: cannot set very magic permanently, so this mappings are a work around, they set very magic
cnoremap %s/ %s/\v

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

au! FileType sql call MapeosSQL()

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


" Notes on indenting
" Certain indenting options override others, this is the precedence list:
" indentexpr -> cindent -> smartindent -> autoindent
" where the -> indicates overriding, so indenexpr overrides any other setting
" That's why there's no point in putting more than one of these. However, sometimes, by concatenation of
" several rules you get more than one of these set, so it would be a reassuring practice,though I don't know
" if really needed, to unset the ones not used
