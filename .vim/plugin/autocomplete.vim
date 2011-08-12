" 括号补全

inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<Up><ESC>A
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

function! ClosePair(char)
    if getline('.')[col('.')-1]==a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

