augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldenable
augroup END


" Übergreifende Grundeinstellungen ————————————————— {{{

" wie viele Spaces hat ein Tab
set tabstop=3

" wie viele Spaces wird eingerückt
set shiftwidth=3

" behält Einrückungsstufe bei Zeilenumbruch bei
set autoindent

" verhindert Konvertierung von Tabs zu Spaces
set noexpandtab

" Rücktaste löscht auch über Zeilenumbrüch (etc.) hinweg
set backspace=indent,eol,start

" aktiert Filetype-bezogene Einstellungen (.vim/ftplugin)
filetype plugin indent on

" aktiviert Zeilennummerierung
set number 

" aktiviert relative Zeilennummerierung
set relativenumber

" aktiviert Syntax-Highlighting
syntax on

" markiert Suchergebnisse
set hlsearch 

" Ignore Case (in Search)
set ignorecase

" Casesensitive bei Eingabe einer Versalie
set smartcase

" sucht während Eingabe
set incsearch

" rückt Wort in nächste Zeile, falls es nicht mehr Platz hat
set linebreak

" Show as much as possible of a wrapped last line, not just @.
set display=lastline

" Einrückungen werden bei Wrap beibehalten
set breakindent

" für Settings die mit File gespeichtert werden /* vim: set tabstop=8 */
set modeline 

set grepprg=internal

" ermöglicht Scrollen
"set mouse=n

set exrc " lädt vimrc vom aktuellen Directory
set secure " soll Ausführen von Befehlen im vimrc verhindern

" gibt an, wie viele Farben im Terminal möglich sind
set t_Co=256   " This may or may not be needed.
set term=xterm-256color-italic

" ermöglicht Italics
highlight Comment cterm=italic

" Wo werden neue Fenster geöffnet?
set splitbelow
set splitright

" blendet Header von Filebrowser aus
let g:netrw_banner = 1

" Folding basiert auf Einrückungen, wird aber deaktiviert
set foldmethod=indent
set nofoldenable
set fml=0

" sucht nach tags-File
set tags=./tags;/

" Redrawing ist wahrscheinlicher
set ttyfast

" verringert mögliche Latenz zw. Terminal & vim
set ttimeout
set ttimeoutlen=50

" zeicht unvollständige Befehle
set showcmd

" bessere Befehlsvervollständigung
set wildmenu

" lege fest, wie aktuelle Zeile hervorgehoben wird
set cursorlineopt=number

" }}}


" Mappings -------------- {{{

" mapt den <Leader>-Key auf ' ' (default ist '\')
let mapleader = " "

nnoremap <leader>O O<esc>j
nnoremap <leader>o o<esc>k
nnoremap <leader><cr> i<cr><Esc>

" nnoremap / /\v
" cnoremap %s/ %s/\v

nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" show definition in preview window
nnoremap ä :tj <c-r><c-w><cr>
nnoremap <leader>ä :ptj <c-r><c-w><cr>

"}}}


" Color Schemes -------------- {{{

" enable 24bit true color
set termguicolors

" führt eigenes Shell-Skript aus, um zu erkennen, ob Darkmode aktiviert ist
if system("is-darkmode.sh") == 1
	set background=dark
	pa rigel
	color rigel
else
	set background=light
	color summerfruit256
endif

"}}}


" Plugin-Einstellungen -------------------------- {{{

" für Goyo
let g:goyo_width=92
"let g:goyo_height='100%'
let g:goyo_linenr=1 " Zeilennummerierung?
let g:goyo_margin_top=0
let g:goyo_margin_bottom=0

"}}}


" Autocommands -------------------------- {{{

augroup autocommands
	" löscht alle bestehenden autocmds
	au!

	au FileType text,markdown packadd goyo
	"au FileType markdown packadd markdown-folding

	" aktiviert wrap im diff-Modus
	au FilterWritePre * if &diff | setlocal wrap | endif

	" aktiviere Plugin für GLSL-Syntax-Highlighting
	au BufNewFile,BufRead *.vs,*.fs,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp,*.glsl set ft=glsl
	" aktiviert eigenes Folding-Plugin
	au FileType cpp,arduino,c,processing,java packadd c-esque-folding

augroup END

"}}}

