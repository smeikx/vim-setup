inoremap <c-k> <c-r>=<SID>create_link()<cr><Esc>F]i

function <SID>create_link ()
	let l:link = ''
	if match (@*,'\w\+\.[a-z]\{2,}') != -1
		let l:link = '[](' . @* . ')'
	else
		let l:link = '[]()'
	endif
	return l:link
endfunc
