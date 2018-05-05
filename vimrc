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
set ic

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

" ermöglicht Scrollen
"set mouse=n

set exrc " lädt vimrc vom aktuellen Directory
set secure " soll Ausführen von Befehlen im vimrc verhindern

" gibt an, wie viele Farben im Terminal möglich sind
set t_Co=256   " This is may or may not needed.

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

" }}}

" Mappings -------------- {{{
" mapt den <Leader>-Key auf ' ' (default ist '\')
let mapleader = " "

nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>
nnoremap <leader><cr> i<cr><Esc>

" nnoremap / /\v
" cnoremap %s/ %s/\v

nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}

" Color Schemes -------------- {{{

"color PaperColor
"color bclear
"color contrastneed
"color dracula
"color hemisu
"color kolor
"color luna
"color monokai
"color seattle
"color seti
"color sol
"color summerfruit256
"color vice
"color woju

"}}}

" Plugin-Einstellungen -------------------------- {{{

" für Emmet
let g:user_emmet_expandabbr_key = '<C-e>'


" für Goyo
let g:goyo_width=70
"let g:goyo_height='100%'
let g:goyo_linenr=0 " Zeilennummerierung?
let g:goyo_margin_top=1
let g:goyo_margin_bottom=1

augroup autocommands
	" löscht alle bestehenden autocmds
	au!

	" aktiviert wrap im diff-Modus
	au FilterWritePre * if &diff | setlocal wrap | endif

	" aktiviere Plugin für GLSL-Syntax-Highlighting
	au BufNewFile,BufRead *.vs,*.fs,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp,*.glsl set ft=glsl
augroup END
"}}}

