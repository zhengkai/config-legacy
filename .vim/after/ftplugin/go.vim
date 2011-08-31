function! InsertTabWrapper()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-N>"
	endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

set autoindent

