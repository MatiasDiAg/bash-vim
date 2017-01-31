set nocompatible

""" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" 					auto-approve removal
"

""" inicializar vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Plugins
"Plugin 'ardagnir/vimbed'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'eparreno/vim-matchit'
Plugin 'easymotion/vim-easymotion'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/showmarks'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'edkolev/tmuxline.vim'
" tipografia
Plugin 'powerline/fonts'
""" Color scheme
Plugin 'tomasr/molokai'
"Plugin 'sickill/vim-monokai'
"Plugin 'altercation/vim-colors-solarized'
" Snippets
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/context_filetype.vim'
""" Vundle
Plugin 'gmarik/Vundle.vim'

""" finalizar vundle
call vundle#end()
filetype plugin indent on
let mapleader=","

""" Maps
map  <F2>  :NERDTreeToggle<CR>
nmap <F3>  :Explore<CR>
nmap <F4>  :SyntasticCheck<CR>
nmap <F6>  :bp<CR>
nmap <F7>  :bn<CR>
nmap <F8>  :Bclose<CR>
nmap <F10> :ShowMarksToggle<CR>
nnoremap <F12> :e ++enc=utf-8<CR>

" Leader maps
" Leader + W = grabar el fichero actual como root
noremap <Leader>W :w !sudo tee % > /dev/null

""" Abreviaciones
iabbrev <// </<C-X><C-O>
let delimitMate_matchpairs = "(:),[:],{:}"

""" Opciones generales
syntax on
set incsearch
set number
set ruler
set nobackup
set ttyfast
set lazyredraw
set mouse=a
set ttymouse=xterm2

""" Opciones de linea y tab
"set cursorline
set cc=80
set tabstop=4
set sw=4
set autoindent

" Desplazamiento en lineas cortadas
"nnoremap <silent> <Up> gk
"nnoremap <silent> <Down> gj
"inoremap <silent> <Up> <C-O>gk
"inoremap <silent> <Down> <C-O>gj
"vnoremap <silent> <Up> gk
"vnoremap <silent> <Down> gj
map 	<silent> <home> g<home>
imap 	<silent> <home> <C-o>g<home>
map 	<silent> <End> g<End>
imap 	<silent> <End> <C-o>g<End>

" Sincronización de búffers
" set scrollbind
" syncbind

""" Convertir espacios en tabuladores
" set expandtab

" CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Cerrar Vim si NerdTree es la unica ventana abierta
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
	\ b:NERDTreeType == "primary") | q! | endif

" Cargar el esquema de colores
"set background=dark
"colorscheme solarized
"colorscheme desert
let g:rehash256 = 1
set t_Co=256
set laststatus=2
colorscheme molokai
if &diff
    colorscheme evening
endif

""" indent-guides: activar con ,ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd ctermbg=black
"hi IndentGUidesEven ctermbg=darkgrey

""" Mostrar las marcas a-z y A-Z en un color concreto:
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"highlight ShowMarksHLl ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
"highlight ShowMarksHLu ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
"highlight SignColumn ctermfg=Blue ctermbg=NONE guifg=Blue guibg=Black
"nmap <F9> <ESC>:sign unplace *<CR>

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


" Plugin key-mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior for NeoSnippets.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": ["html", "php"] }

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tmuxline#enabled = 1

" whitespace checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]

" Airline Tab map
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

