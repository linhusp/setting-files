" First load 
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
	echo "Installing Vim-plug..."
	echo ""
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let vim_plug_just_installed = 1
endif

" Load plug
if vim_plug_just_installed
	:execute 'source '.fnameescape(vim_plug_path)
endif

" Begin declaring----------------------
call plug#begin('~/.vim/plugged')

" PLUGINS FROM GITHUB:
" VScode theme
Plug 'tomasiser/vim-code-dark'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension for fuzzy finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Surround text
Plug 'tpope/vim-surround'
" Indent text obj
Plug 'michaeljsmith/vim-indent-object'
" Indentation based on movememts
Plug 'jeetsukumaran/vim-indentwise'
" Python autocompletion
Plug 'davidhalter/jedi-vim'
" Python formatter
if has('python')
	Plug 'pignacio/vim-yapf-format'
endif	
" Better autocompletion
Plug 'Shougo/neocomplcache.vim'
" Language code checker
" Plug 'scrooloose/syntastic'
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Paint CSS color
Plug 'lilydjwg/colorizer'
" Autoclose
Plug 'Townk/vim-autoclose'

" PLUGINS FROM VIM-SCRIPTS:
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navication
Plug 'vim-scripts/matchit.zip'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Finish declaring plugins-------------
call plug#end()

" VIM SETTINGS-------------------------
" Font encode
set enc=utf-8
" Enable number column
set number
" Tab and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Tab length exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Highlight max width
set colorcolumn=110
" Always show status bar
set ls=2
" NOTE: dont sure how they work
set laststatus=2
set showtabline=1
" set t_ut=
" Install plugins the first time vim run
if vim_plug_just_installed
	echo "Installing Bundles, plz ignore key map error messages"
	:PlugInstall
endif
" Incremental sesarch
set incsearch
" Highlight search results
set hlsearch
" Syntax highlight
syntax on
" Show line numbers
set nu
" Tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
" Navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
" Save as sudo
ca w!! w !sudo tee "%"
" Simple recursive grep
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>
" Use 256 colors
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
	colorscheme codedark
else
	colorscheme codedark
endif
" Keep cursor 3 lines away from border when scrolling
set scrolloff=3
" Backup
set directory=~/.vim/dirs
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/'
if !isdirectory(&directory)
	call mkdir(&directory, "p")
endif	

" VSCODE THEME-------------------------
" let g:codedark_conservative = 1

" CTRLP--------------------------------
" file finder mapping
let g:ctrlp_map = ',e'
" tags in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder
nmap ,m :CtrlPMURFiles<CR>
" command finder
nmap ,c :CtrlPCmdPalette<CR>
" can call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
	execute ':CtrlP' . a:ctrlp_command_end
	call feedkeys(a:search_text)
endfunction
" dont change wd
let g:ctrlp_working_path_mode = 0
" ignore files and folders on file finder
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
	\ 'file': '\.pyc$\|\.pyo$',
	\ }

" JEDI-PYTHON AUTO COMPLETION----------
" go to definition
let g:jedi#goto_command = ',d'
" find ocurrences
let g:jedi#usages_command = ',o'
" find assignment
let g:jedi#goto_assignments_command = ',a'
" goto definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NEOCOMPLCACHE-PYTHON AUTOCOMPLETION--
" NOTE:Dont sure how they work
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1 
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'  

" DRAG VISUALS-------------------------
" move block in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" SYNTASTIC-LANGUAGE CODE CHECKER------
" show errors and warnings on current file
nmap <leader>e :Errors<CR>
" check when just opened the file
let g:syntastic_check_on_open = 1
" dont put icons on the sign column
let g:syntastic_enable_signs = 0

" AIRLINE------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'codedark'
let g:airline#extensions#whitespace#enabled = 0

" AUTOCLOSE----------------------------
" Let ESC work as expected with this
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
