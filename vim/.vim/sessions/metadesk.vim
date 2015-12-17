" ~/.dotfiles/vim/.vim/sessions/metadesk.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 16 December 2015 at 23:59:00.
" Open this file in Vim and run :source % to restore your session.

set guioptions=cMg
silent! set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'PaperColor' | colorscheme PaperColor | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/startup.sh', 'text': 'To git@github.com:alexozer/metadesk.git'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/startup.sh', 'text': '   a493447..4ef9980  master -> master'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/go/src/github.com/alexozer/metadesk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +35 README.md
badd +1 nothing.latex
badd +1 test/clean.sh
badd +1 test/lemontest.sh
badd +31 test/test.sh
badd +1 metadesk.png
badd +89 server/desktop.go
badd +50 metadesk.go
badd +223 server/cmdline.go
badd +52 server/wm.go
badd +36 server/server.go
badd +60 ~/.vimrc
badd +33 client/mdc.go
badd +1 .git/refs/heads/master
badd +20 ~/.dotfiles/bspwm/.config/bspwm/bspwmrc
badd +21 ~/.dotfiles/bspwm/.config/bspwm/metadesk.sh
badd +12 ~/.dotfiles/bspwm/.config/bspwm/startup.sh
argglobal
silent! argdel *
edit metadesk.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 240 + 136) / 272)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 35 - ((34 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 024|
lcd ~/code/go/src/github.com/alexozer/metadesk
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 240 + 136) / 272)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/code/go/src/github.com/alexozer/metadesk
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 77|vert 1resize 31|2resize 77|vert 2resize 240|
2wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
