"set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
set complete-=k complete+=k

function! InsertTabWrapper()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-X>\<C-O>"
	endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

