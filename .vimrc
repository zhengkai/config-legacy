"set t_Co=256

set backupdir=~/.backup/vim
set nocompatible

set ruler
set showcmd
set incsearch

set tabstop=4
set shiftwidth=4

set showmatch
set number

"source ~/.vim/session/%:t.session
"rviminfo ~/.vim/session/%:t.viminfo

"au VimLeave * mksession! ~/.vim/session/%:t.session
"au VimLeave * wviminfo! ~/.vim/session/%:t.viminfo

autocmd BufWritePre * :%s/\s\+$//e

filetype plugin on

au BufNewFile,BufRead .zhengkai,.zhengkai_alias call SetFileTypeSH("bash")

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

hi clear
"hi Comment  ctermfg=244
"hi Define   ctermfg=LightGreen

"hi String   ctermfg=46
"hi Boolean  ctermfg=LightCyan
"hi Number   ctermfg=LightCyan
"hi Float    ctermfg=LightCyan
"hi phpInclude ctermfg=LightGreen
"hi phpParent ctermfg=LightMagenta

"if [ "$TERM" = "xterm-256color" ]
if &t_Co == 256
	colorscheme desert256
	hi LineNr   ctermbg=232 ctermfg=246
	hi Pmenu    ctermbg=235
	hi PmenuSel ctermbg=237
endif

set cursorline
hi CursorLine cterm=NONE ctermbg=234

set laststatus=2
set numberwidth=5
set sidescrolloff=10
set statusline=%F%m%r%h%w[%L][%{&ff}]%10y[%3p%%][%4l,%4v]

set tags=/www/pet/tag

if filereadable(expand('~/.vim/after/completion.vim'))
	source ~/.vim/after/completion.vim
endif

source ~/.vim/tabline.vim

au FileType php,css,js so ~/.vim/autocomplete.vim

nmap <F1> <nop>

