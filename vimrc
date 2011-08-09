"if has("gui_running")
"    colorscheme python
"    set guifont=Conslas\ bold\ 10
"else
"    colorscheme elflord
"endif 

syntax on
filetype plugin indent on
set autoindent
set number
set cul
set linebreak
set tw=79 
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L]
"set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m
"set makeprg=python\ %<.py

highlight BadWhitespace ctermbg=red guibg=red

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1

let g:tlTokenList = ['FIXME', 'TODO', 'TEST', 'XXX']


map <F3> :NERDTreeToggle<CR>
"map <F4> :TlistToggle<CR>
map <F4> <Plug>TaskList
map <F2> :marks
" CRA binDINGZ
map <F5> :set filetype=htmldjango<CR>
map <F6> :nohlsearch<CR>
map <C-F9> :make<CR>
map <C-F10> :cn<CR>
map <C-F11> :cp<CR>
map <C-F12> :cl<CR>

autocmd FileType html set omnifunc=htmlcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#Complete

au BufRead *.html set filetype=htmldjango
"pep 8 \o\o\o
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"au BufRead,BufNewFile *.tex, *.cpp, *.hpp set makeprg=make

set tags=tags;$HOME/.vim/tag/



" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" one-handed dvorak: right hand 
nnoremap A H
nnoremap a h
nnoremap E J
nnoremap e j
nnoremap H K
nnoremap h k
nnoremap T L
nnoremap t l

imap ii <Esc>

"python << EOF
"import os
"import sys
"import vim
"sys.path.append("/usr/lib/python2.6")
"EOF
""exe ":source ~/opt/pysmell.vim"
""autocmd FileType python set omnifunc=pysmell#Complete
