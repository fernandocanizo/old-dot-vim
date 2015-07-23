set textwidth=0

set autoindent
set nosmartindent

" use TAB character when TAB key is pressed
set noexpandtab

" number of spaces to show for a TAB
set tabstop=4

" number of spaces for indent with >>
set shiftwidth=4

" number of spaces for a tab in editing operations
set softtabstop=4

" F1 comment line
map <F1> I<!-- A -->j

" F2 uncomment line
map <F2> :s/\v^(\s*)\<!-- (.+)\s*--\>/\1\2/<enter>

" F3 create blank comment ready for insertion
map <F3> i<!--   -->k5li

" html5 template
map <F4> gg:r /home/conan/csoft/library/html/html5.simple.html<enter>ggdd
