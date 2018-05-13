function! IsPreviewWindow()
	if getwinvar(1, "&pvw") == 1
		return 1
	endif
	return 0
endfunction
