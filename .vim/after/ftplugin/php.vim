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

iab func function

set autoindent
set endofline

