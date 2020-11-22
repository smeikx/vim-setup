command! -nargs=* -complete=file_in_path Lua call <SID>make_lua(<q-args>)
function! s:make_lua(args)
	execute "terminal lua " . a:args . " %"
endfunction

pa c-esque-folding
