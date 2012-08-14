" TEST code code code
"set smartcase
set viminfo='10,"100,:20,%,n~/.viminfo
" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" colorscheme elflord
"colorscheme koehler
"colorscheme pablo 
"colorscheme fruity
"colorscheme darkblue
"colorscheme moria

"mappings
"map <F4> <Esc> :WriteBackup

set nocompatible
set bs=2
set cindent

"set mouse=a
if !has('gui_running')
	set mouse=
endif
set nowrapscan

"cra tuning
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set tabstop=4
set nu
set ai
set cul
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
"set smd

set showmatch
set showmode
set uc=0
set t_kD=^?
map ^H X
map \e[3~ x
set mousehide
set hlsearch
let c_comment_strings=1

" Color for xiterm, rxvt, nxterm, color-xterm :
if has("terminfo")
set t_Co=8
set t_Sf=\e[3%p1%dm
set t_Sb=\e[4%p1%dm
else
set t_Co=8
set t_Sf=\e[3%dm
set t_Sb=\e[4%dm
endif

"au! BufRead,BufNewFile *.pde set filetype=pde
au BufRead,BufNewFile *.pde map <F5> :set filetype=cpp<CR>
au BufRead,BufNewFile *.html map <F5> :set filetype=htmldjango<CR>
au BufRead,BufNewFile *.pde set makeprg=make
au! BufRead,BufNewFile *.py set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
syntax on

filetype plugin indent on

function! ChangeFileencoding()
    let encodings = ['cp1251', 'koi8-u', 'cp866']
    let prompt_encs = []
    let index = 0
    while index < len(encodings)
	call add(prompt_encs, index.'. '.encodings[index])
	let index = index + 1
    endwhile
    let choice = inputlist(prompt_encs)
    if choice >= 0 && choice < len(encodings)
	execute 'e ++enc='.encodings[choice].' %:p'
    endif
endf
nmap <f8> :call ChangeFileencoding()<cr>

set errorformat=%f:%l:\ %m
imap <F2> <Esc>Vgq
nmap <F2> Vgq
map <F5> :set filetype=rst<CR>
map <F9> :make<CR>
map <F10> :cn<CR>
map <F11> :cp<CR>
map <F12> :cl<CR>

" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse latex-suite. Set your grep
" " program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

let g:pymode_lint_write=0

" Latex-suite
set shellslash
let g:tex_flavor='latex'
"set iskeyword+=:

set virtualedit=block
highlight PmenuSel ctermbg=lightred gui=bold
