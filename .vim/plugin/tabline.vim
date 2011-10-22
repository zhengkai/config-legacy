set tabline=%!MyTabLine()

function MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" 选择高亮
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" 设置标签页号 (用于鼠标点击)
		let s .= '%' . (i + 1) . 'T'

		" MyTabLabel() 提供标签
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	endfor

	" 最后一个标签页之后用 TabLineFill 填充并复位标签页号
	let s .= '%#TabLineFill#%T'

	" 右对齐用于关闭当前标签页的标签
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999Xclose'
	endif

	return s
endfunction

function MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return bufname(buflist[winnr - 1])
endfunction


