augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldenable
augroup END


" Basic Behaviour -------------- {{{

	" backspace deletes beyond line breaks
	set backspace=indent,eol,start

	" display word in next line if it’s too long (word wrap)
	set linebreak

	" keep indendation for wrapped words
	set breakindent

	" show as much as possible of a wrapped last line, not just @
	set display=lastline

	" disable automatik line break
	set textwidth=0

" }}}


" Indentation -------------- {{{

	" How many spaces does pressing tab produce?
	set tabstop=3

	" How many spaces shall be used for indentation?; 0 → use same as tabstop
	set shiftwidth=0

	" keeps indentation on linebreak
	set autoindent

	" prevents conversion of tabs to spaces
	set noexpandtab

" }}}


" Search -------------- {{{

	" activate syntax higlighting
	syntax on

	" highlight search results
	set hlsearch 

	" ignore case (in search)
	set ignorecase

	" make search case sensitive if query contains upper case letters
	set smartcase

	" progresses search while typing
	set incsearch

" }}}


" Line Numbers -------------- {{{

	" show line numbers
	set number 

	" show line numbers relative to current line
	set relativenumber

" }}}


" Folding -------------- {{{

	" fold based on indentation
	set foldmethod=indent

	" deactivate folding on start
	set nofoldenable

	" How many lines are needed for a fold?
	set foldminlines=0

" }}}


" Convenience -------------- {{{

	" show commands entered in the lower right corner
	set showcmd

	" show better suggestions when entering commands and pressing tab
	set wildmenu

	" show list of suggestions when hitting Tab in wildmenu
	set wildmode=list:full
" }}}


" Display & Terminal -------------- {{{

	" specify the terminal’s color capacities
	set t_Co=256 " This may or may not be needed.

	" enable 24 bit true color if not in virtual console
	if $TERM != 'linux'
		set termguicolors
	endif

	" also enable true color for tmux
	if exists("$TMUX")
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif

	" increase probability of redrawing screen, potentially preventing glitches
	set ttyfast

	" reduce latency between the terminal and vim
	set ttimeout
	set ttimeoutlen=50
	set timeoutlen=200

" }}}


" General -------------- {{{

	" activate file type plugins (.vim/ftplugin)
	filetype plugin indent on

	" Where are new windows created?
	set splitbelow
	set splitright

	" hide the file browser’s header
	let g:netrw_banner = 1

	" search for ctags-generated tags file in working dir
	set tags=./tags;/

	" use vim’s internal grep for :grep
	" TODO: just use ripgrep somehow, might make custom Rg obsolete
	set grepprg=internal

	" allow saving vim-specific settings within a file, e.g.:
	" /* vim: set tabstop=8 */
	set modeline 

	" also look for vimrc in working directory
	set exrc 

	" prevent running commands from within a vimrc
	set secure

" }}}



" Mappings -------------- {{{

	" maps  <leader> key to space (default is slash)
	let mapleader = " "

	" quickly edit and source the vimrc
	nnoremap <leader>ev :tabe $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>

	" TODO: Consider LSP and other modern methods — and the keyboard layout.
	" show definition in preview window, using the tag system
	"nnoremap ä :tj <c-r><c-w><cr>
	"nnoremap <leader>ä :ptj <c-r><c-w><cr>

"}}}


" Color Schemes -------------- {{{

	" make all comments italic
	"highlight Comment cterm=italic

	" run custom shell script for determining if the system prefers a dark color scheme
	if system("is-darkmode.sh") == 1
		set background=dark
		color rigel
	else
		set background=light
		color summerfruit256
	endif

"}}}


" Package-Specific Settings -------------------------- {{{

	" Goyo
	let g:goyo_width=92
	"let g:goyo_height='100%'
	let g:goyo_linenr=1 " line numbers
	let g:goyo_margin_top=0
	let g:goyo_margin_bottom=0

"}}}


" Autocommands -------------------------- {{{

	augroup autocommands

		" delete all autocommands
		au!

		" also activate word wrap for diff mode (vimdiff)
		au FilterWritePre * if &diff | setlocal wrap | endif

	augroup END

"}}}

