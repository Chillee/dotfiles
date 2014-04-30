""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Behavior ................ Omni-complete, etc...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " get rid of Vi compatibility mode

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set history=50		" keep 50 lines of command line history
set undofile
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" Git commit messages, wrap to 72 characters and spellcheck
autocmd Filetype gitcommit setlocal spell textwidth=72
" Rename tmux tab to vim file
"autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
	if &term =~ '^screen'
		" tmux knows the extended mouse mode
		set ttymouse=xterm2
	endif
endif

set relativenumber        " show relative line numbers
"set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase
set ruler                 " Always show info along bottom.
"set showmatch
set showcmd               " display incomplete commands
set hidden				  " Okay to background buffers when modified

" GVim-specific settings
set guioptions+=PegitrL
set guioptions-=mT
set guifont=Terminess\ Powerline\ 14
set guiheadroom=0

"noremap <F7> :silent !tmux set status<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set smarttab              " use tabs at the start of a line, spaces elsewhere
set cursorline
"set nowrap                " don't wrap text
" Don't use Ex mode, use Q for formatting
map Q gq
" Make Y behave like D and C, instead of like yy
noremap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Behavior                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
let maplocalleader = "\\"

nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
" Training mappings
nnoremap 0 <nop>
vnoremap 0 <nop>
nnoremap $ <nop>
vnoremap $ <nop>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
set so=5

noremap <tab> :bnext<cr>
noremap <backspace> :bprev<cr>

nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k

nnoremap gH <C-w>H
nnoremap gL <C-w>L
nnoremap gJ <C-w>J
nnoremap gK <C-w>K

set foldmethod=syntax
set nofoldenable
"set foldlevelstart=0
nnoremap <Space> za
vnoremap <Space> za
nnoremap zO zCzO

set clipboard=unnamedplus

" Easymotion
"let g:EasyMotion_smartcase = 1
"nnoremap s <Plug>(easymotion-s)
"hi link EasyMotionShade Comment

" Syntastic
"let g:syntastic_mode_map = { 'mode': 'passive', }
let g:syntastic_auto_jump = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 1

" Golang
let g:gofmt_command = "goimports"
au FileType go au BufWritePre <buffer> silent Fmt
au FileType go nnoremap <silent> <leader>x :wa<cr>:GolangRun<cr>

" Plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<silent> <leader>e'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'benmills/vimux'
nnoremap <silent> <leader>r :wall<cr>:VimuxRunLastCommand<cr>
nnoremap <F5> :VimuxTogglePane<cr>
autocmd VimLeave * VimuxCloseRunner
Bundle 'benmills/vimux-golang'
Bundle 'scrooloose/nerdcommenter'
Bundle 'baskerville/vim-sxhkdrc'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
"Bundle 'Xuyuanp/git-nerdtree'
Bundle 'scrooloose/nerdtree'
nnoremap <F3> :NERDTreeToggle<cr>
" YouCompleteMe installed with pacman
set completeopt-=preview
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-bufferline'
let g:bufferline_echo = 0
let g:bufferline_show_bufnr = 0
"let g:bufferline_rotate = 1

Bundle 'w0ng/vim-hybrid'
syntax enable
" A dark bg actually means same as termcolors
set background=dark
if (!has('gui_running'))
	set t_Co=256
	let g:hybrid_use_Xresources = 1
endif
colorscheme hybrid
