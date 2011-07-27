set t_Co=256

set backupdir=~/.backup/vim
set nocompatible

set ruler
set showcmd
set incsearch

set tabstop=4
set shiftwidth=4

set showmatch
set number

iab func function

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
set complete-=k complete+=k

function! InsertTabWrapper()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-N>"
	endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

hi clear
"hi Comment  ctermfg=244
"hi Define   ctermfg=LightGreen

"hi String   ctermfg=46
"hi Boolean  ctermfg=LightCyan
"hi Number   ctermfg=LightCyan
"hi Float    ctermfg=LightCyan
"hi phpInclude ctermfg=LightGreen
"hi phpParent ctermfg=LightMagenta

colorscheme desert256  
hi LineNr   ctermbg=232
hi Pmenu    ctermbg=235
hi PmenuSel ctermbg=237

set cursorline
hi CursorLine cterm=NONE ctermbg=234

set laststatus=2
set numberwidth=5
set sidescrolloff=10
set statusline=%F%m%r%h%w[%L][%{&ff}]%10y[%3p%%][%4l,%4v]

