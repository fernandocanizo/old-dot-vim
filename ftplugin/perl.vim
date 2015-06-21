" F1 comment line
map <F1> 0i#<esc>j
imap <F1> <esc>0i#<esc>j

" F2 uncomment line
map <F2> :s/^#//e<return>:noh<return>j
imap <F2> <esc>:s/^#//e<return>:noh<return>j

" F3 structured comment
map <F3> o<esc>i#<esc>a#<esc>148.<esc>yypO# 
imap <F3> <esc>o<esc>i#<esc>a#<esc>148.<esc>yypO# 

" F4 header
map <F4> ggO#!/usr/bin/env perl<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando L. Canizo (http://flc.muriandre.com/)<enter><enter>use warnings;<enter>use strict;<enter>use 5.12.2;<enter><enter>
imap <F4> <esc>ggO#!/usr/bin/env perl<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando L. Canizo (http://flc.muriandre.com/)<enter><enter>use warnings;<enter>use strict;<enter>use 5.12.2;<enter><enter>

" do not wrap lines
set textwidth=0
set nowrap

set cindent

colorscheme conanperlgray
