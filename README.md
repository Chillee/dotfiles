# Alex Ozer's Dotfiles

This is where I share my dotfiles, with terrible commit messages that is.

Current screenshots:
![empty](empty.png)
![fakebusy](fakebusy.png)

I use:
- Macbook Pro Retina 2015 (MF840LL/A)
- Xfce (desktop environment minus window manager)
- Bspwm (window manager)
- Compton (transparency, shadows...)
- Numix Circle (icon theme)
- Arc Darker (gtk theme)
- Human (cursor theme)
- Whiskermenu (launcher)
- Gnome terminal with zsh
- Neovim (text editor)

You can symlink these dotfiles to your home directory using GNU stow:
```bash
$ cd
$ git clone https://github.com/alexozer/dotfiles.git .dotfiles
$ cd .dotfiles
$ stow [dir]
```
