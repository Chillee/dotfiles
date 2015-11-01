" ~/.dotfiles/.vim/sessions/metadesk.vim:
" Vim session script.
" Created by session.vim 2.13 on 24 October 2015 at 19:56:04.
" Open this file in Vim and run :source % to restore your session.

set guioptions=cMg
silent! set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([])
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
badd +70 client/client.go
badd +28 server/server.go
badd +29 main.go
badd +1 \'/home/alex/code/go/src/github.com/alexozer/metadesk/server/desktop.go\'
badd +55 server/desktop.go
badd +1 \'/home/alex/code/go/src/github.com/alexozer/metadesk/server/desktopmanager.go\'
badd +1 \'/home/alex/code/go/src/github.com/alexozer/metadesk/server/wm.go\'
badd +1 \'/home/alex/code/go/src/github.com/alexozer/metadesk/server/windowmanager.go\'
badd +25 server/wm.go
badd +71 ~/.vimrc
argglobal
silent! argdel *
edit server/desktop.go
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 30 + 34) / 69)
exe '2resize ' . ((&lines * 36 + 34) / 69)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 22 - ((19 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 0
lcd ~/code/go/src/github.com/alexozer/metadesk
wincmd w
argglobal
edit ~/code/go/src/github.com/alexozer/metadesk/server/wm.go
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 24 - ((23 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
lcd ~/code/go/src/github.com/alexozer/metadesk
wincmd w
exe '1resize ' . ((&lines * 30 + 34) / 69)
exe '2resize ' . ((&lines * 36 + 34) / 69)
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
