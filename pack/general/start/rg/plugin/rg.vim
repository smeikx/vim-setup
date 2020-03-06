function! Rg(...)
	let original_grepprg = &grepprg
	let original_grepformat = &grepformat

	set grepprg=rg\ --vimgrep\ $*
	set grepformat=%f:%l:%c:%m

	execute "silent! grep " . join(a:000) . "|redraw!|copen"

	let &grepprg = original_grepprg
	let &grepformat = original_grepformat
endfunction

command! -nargs=+ -complete=file -bar Rg call Rg(<q-args>)

