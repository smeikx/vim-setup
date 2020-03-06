" this check prevents loading plugins for Markdown files
if (&filetype == 'html')
	 setlocal foldmethod=indent
	 packadd emmet
	 packadd closetag
	 packadd vim-javascript
endif
