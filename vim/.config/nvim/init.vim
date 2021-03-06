" Alex Ozer

if !has('nvim')
	set nocompatible
endif

" Plug {{{ 
call plug#begin('~/.vim/plugged')

" colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

" languages
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'baskerville/vim-sxhkdrc', {'for': 'sxhkdrc'}
Plug 'sudar/vim-arduino-syntax', {'for': 'arduino'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'the-lambda-church/merlin', {'for': 'ocaml', 'rtp': 'vim/merlin'}
Plug 'LnL7/vim-nix'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" tools
Plug 'junegunn/vim-plug'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
if has('nvim')
  function! DoRemote(arg)
	UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'zchee/deoplete-clang', {'for': 'cpp'}
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/syntastic', {'for': 'ocaml'}
Plug 'reedes/vim-pencil'

" maybe wanted in the future
"Plug 'bling/vim-bufferline' " show buffer list in status bar
"Plug 'moll/vim-bbye' " when buffer closed, don't close window
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'Raimondi/delimitMate'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --gocode-completer' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
""Plug 'rust-lang/rust.vim'
"Plug 'arakashic/chromatica.nvim' " didn't like colors, flickers
"Plug 'dkarter/bullets.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
" }}}
" Leader {{{
let mapleader=","		" leader is comma
let maplocalleader="\\"
" }}}
" Spaces {{{
filetype plugin indent on

set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4        " no seriously, four spaces per tab
set nojoinspaces
" }}}
" UI {{{
if has('nvim')
	set termguicolors
endif

set timeoutlen=1000
set ttimeoutlen=0

set relativenumber		" show line numbers relative to current
set ruler " always show bottom bar
set laststatus=2 " always show status bar
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)
set cursorline			" highlight current line
set mouse=a

set background=dark
colorscheme PaperColor

call togglebg#map("<leader>5")

syntax enable			" enable syntax processing

" Use ; instead of : for Command-line-mode
noremap ; :
noremap : ;

set scrolloff=5			" leave lines visible at top and bottom of buffer

set noshowmatch			" don't show matching brackets by flickering

set fillchars=diff:⣿,vert:│

set guitablabel=%t
" }}}
" Buffers, Splits, Tabs {{{
"set splitbelow " Open horizontal splits below current split
"set splitright " Open vertical splits to the right of current split

" splits: use g prefix instead of <C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" easier tab manipulation / navigation
nnoremap <silent> <leader><tab> :tabnew<cr>
nnoremap <silent> <leader><s-tab> :tabc<cr>
nnoremap <silent> <tab> :tabn<cr>
nnoremap <silent> <s-tab> :tabp<cr>

" easier to escape neovim terminal
if has('nvim')
	tnoremap <esc> <c-\><c-n>
endif

" split below and right
set splitbelow
set splitright

set hidden		" okay to background modified buffers

nnoremap <leader><leader> :e#<cr> " open last file
" }}}
" Searching {{{
set incsearch			" search as characters are entered
set ignorecase			" case-insensitive
set smartcase			" override ignorecase if search includes capital letters
set nohlsearch

set gdefault			" when using :s command, replace all instances on line by default
" }}}
" Folding {{{
set nofoldenable
nnoremap <space> za
" }}}
" Movement {{{ 
" make Y behave like D and C, instead of like yy
nnoremap Y y$	

" easier than ^ and $ and I never use the default behavior.
" some plugins like to remap $ and 0 and I'd like to use their remappings,
" so I use *map instead of *noremap
nmap 0 ^
vmap 0 ^
nmap H 0
vmap H 0
nmap L $
vmap L $
" }}}
" Backups {{{
set backup							" enable backup
set undofile
set noswapfile				" disable swap files

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
" }}}
" Autocmd {{{ 

" jump to last cursor position in file
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction

augroup restore_cursor
	autocmd!
	autocmd BufReadPost * call SetCursorPosition()
augroup END

augroup arduino
	autocmd!
	autocmd FileType arduino setlocal makeprg=make\ -j5
	autocmd Filetype arduino nnoremap <silent><leader>r :make!<cr>
	autocmd Filetype arduino nnoremap <silent> <leader>b :wa<cr>:make!<cr>
	autocmd Filetype arduino nnoremap <silent> <leader>r :wa<cr>:silent! make!<cr>:!./%:r<cr>
	autocmd Filetype arduino nnoremap <silent> <leader>u :wa<cr>:!make upload<cr>
augroup END

augroup latex
	autocmd!
	autocmd FileType tex setlocal nocursorline
	autocmd FileType tex setlocal norelativenumber
augroup END

augroup ocaml
	autocmd!
	autocmd FileType ocaml setlocal tabstop=2
	autocmd FileType ocaml setlocal shiftwidth=2
augroup END
" }}}
" Misc {{{ 
" edit/source vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set clipboard=unnamedplus

" Make word before cursor upper-case
inoremap <c-u> <esc>bgUwgi

" Control-Backspace deletes last work in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"inoremap <c-k> <esc>viwUea
"nnoremap <c-k> m`viwU``
" }}}
" Plugin Config {{{
" vim-go {{{
let g:go_fmt_fail_silently = 1		" don't give an error if formatting fails
"let g:go_highlight_functions = 1
let g:go_fmt_command = 'goimports'

augroup go
	autocmd!
	au FileType go nnoremap gd <Plug>(go-def)
	au FileType go nnoremap <Leader>s <Plug>(go-def-split)
	au FileType go nnoremap <Leader>v <Plug>(go-def-vertical)
	au FileType go nnoremap <Leader>T <Plug>(go-def-tab)
	au FileType go nnoremap <Leader>i <Plug>(go-info)
	au FileType go nnoremap  <silent> <leader>r :wa<cr>:GoRename<cr>
	au FileType go nnoremap  <silent> <leader>b :wa<cr>:GoBuild<cr>
	au FileType go nnoremap  <silent> <leader>t :wa<cr>:GoTest<cr>
	au FileType go nnoremap <Leader>d <Plug>(go-doc)
augroup END
" }}}
" YouCompleteMe {{{
"set completeopt-=preview			" don't open a preview window
"set shortmess+=c				" don't show completion status messages
"let g:ycm_extra_conf_globlist = ['~/code/*'] " load project-specific .ycm_extra_conf.py without asking
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py" " settings for C/C++
" }}}
" deoplete {{{
if has('nvim')
	" general
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#disable_auto_complete = 1
	let g:deoplete#auto_complete_delay = 0
	call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

	" <Tab> completion:
	" 1. If popup menu is visible, select and insert next item
	" 2. Otherwise, if within a snippet, jump to next input
	" 3. Otherwise, if preceding chars are whitespace, insert tab char
	" 4. Otherwise, start manual autocomplete
	imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
		\ : (<SID>is_whitespace() ? "\<Tab>"
		\ : deoplete#mappings#manual_complete())

	smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
		\ : (<SID>is_whitespace() ? "\<Tab>"
		\ : deoplete#mappings#manual_complete())

	inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:is_whitespace() "{{{
		let col = col('.') - 1
		return ! col || getline('.')[col - 1] =~? '\s'
	endfunction "}}}

	augroup deoplete
		autocmd!
		autocmd VimEnter * call deoplete#initialize() " don't lag on first insert
	augroup END

	"" clang_complete
	"let g:clang_complete_auto = 0
	"let g:clang_auto_select = 0
	"let g:clang_default_keymappings = 0
	"let g:clang_use_library = 1
endif

" }}}
" vim-session {{{
let g:session_autoload="no" 		" don't autoload a session when Vim starts
let g:session_autosave="yes"		" auto-save session when Vim is closed
let g:session_persist_globals = ['&makeprg']

nnoremap <silent> <leader>so :OpenSession<cr>
nnoremap <silent> <leader>sO :OpenSession!<cr>
nnoremap <silent> <leader>ss :SaveSession<cr>
nnoremap <silent> <leader>sS :SaveSession!<cr>
nnoremap <silent> <leader>sd :DeleteSession<cr>
nnoremap <silent> <leader>sD :DeleteSession!<cr>
nnoremap <silent> <leader>sr :RestartVim<cr>
nnoremap <silent> <leader>sR :RestartVim!<cr>
" }}}
" vim-javascript-syntax {{{
au FileType javascript call JavaScriptFold()
" }}}
" nerdtree {{{
nnoremap <leader>3 :NERDTreeToggle<cr>
" }}}
" airline {{{
" reset status bar quickly
if !has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		autocmd InsertEnter * set timeoutlen=0
		autocmd InsertLeave * set timeoutlen=1000
	augroup END
endif

set noshowmode			" hide the default mode text ( -- INSERT -- )
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts=1
"let g:airline_theme='base16'
let g:airline_theme='bubblegum'
" }}}
" syntastic {{{
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_mode_map = {'active_filetypes': ['ocaml']}
let g:syntastic_ocaml_checkers = ['merlin']
"let g:syntastic_cpp_checkers = ['clang_check']
" }}}
" neomake {{{
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clangtidy_args = ['-extra-arg=-std=c++14', '-checks=\*']
let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-Wno-pragma-once-outside-header', '-fsyntax-only']
let g:neomake_python_enabled_makers = ['pep8', 'frosted']
"let g:neomake_java_enabled_makers = ['javac']
"let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-Wno-pragma-once-outside-header']
let g:neomake_verbose = 0

augroup Neomake
	autocmd!
	autocmd BufReadPost,BufWritePost * Neomake
augroup END
" }}}
" python-mode {{{
let g:pymode_lint_cwindow=0
let g:pymode_rope_completion=0
"augroup PyModeNoPep8
	"autocmd!
	"autocmd VimEnter * call remove(g:pymode_lint_checkers, index(g:pymode_lint_checkers, 'pep8'))
"augroup END
" }}}
" ctrlp {{{
let g:ctrlp_map = '<leader><space>'
let g:ctrlp_working_path_mode=''
" }}}
" vimtex {{{
let g:tex_flavor='latex'
let g:vimtex_latexmk_progname='nvr'
" }}}
" pencil {{{
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text, call pencil#init({'wrap': 'soft'})
augroup END

let g:pencil#autoformat = 1
let g:pencil#conceallevel = 0
" }}}
" }}}

" vim:foldenable:foldlevelstart=0:foldmethod=marker:foldlevel=0
