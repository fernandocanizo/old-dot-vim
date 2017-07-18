" F1 comment line
map <F1> 0i#<esc>j
imap <F1> <esc>0i#<esc>j

" F2 uncomment lines
map <F2> :s/^#//e<return>:noh<return>j
imap <F2> <esc>:s/^#//e<return>:noh<return>j

" F3 structured comment
map <F3> o<esc>i#<esc>a-<esc>78.
imap <F3> <esc>o<esc>i#<esc>a-<esc>78.

" F4 header
map <F4> ggO#!/bin/bash<enter># Creation date:<esc>:r !date "+\%Y.\%m.\%d"<enter>kJo# by Fernando L. Canizo - http://flc.muriandre.com/<enter><enter># exit if any statement returns false value (can't use $? from now on)<enter>set -o errexit<enter># exit if variable not set<enter>set -o nounset<enter># uncomment to debug<enter>#set -x<enter>

imap <F4> <esc>ggO#!/bin/bash<enter># Creation date:<esc>:r !date -R <enter>kJo# by Fernando Canizo (aka conan) - http://conan.muriandre.com/<enter><enter># exit if any statement returns false value (can't use $? from now on)<enter>set -o errexit<enter># exit if variable not set<enter>set -o nounset<enter># uncomment to debug<enter>#set -x<enter>

set number
set textwidth=0
