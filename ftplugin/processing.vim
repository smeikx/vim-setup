setlocal makeprg=processing-java\ --sketch=%:p:h
command! Run !processing-java --sketch=%:p:h --run

augroup filetype_processing
	au! Syntax <buffer> call SetProcessingSyntax()
augroup end

function! SetProcessingSyntax()
	au! filetype_processing
	set syntax=java
endfunction
