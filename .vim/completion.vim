if &filetype == 'php'
	set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
	set complete-=k complete+=k
endif

function! InsertTabWrapper()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-N>"
	endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

if &filetype == 'php'
	iab func function
endif

"hi LineNr   ctermbg=213

