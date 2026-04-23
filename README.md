# dotfiles
a collection of my dotfiles.

i use `zsh` as my default shell and `oh-my-zsh` framework to manage my `zsh` configuration.

## installation
entry point is the [`make_symlinks.sh`](/make_symlinks.sh) file. it installs `zsh` on your machine and installs `oh-my-zsh` using their official installer.

```bash
git clone https://github.com/masaaldosey/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x make_symlinks.sh
./make_symlinks.sh
```

## `oh-my-zsh` plugins

i use only the bare essentials.

- git ([wiki](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git))
- fzf ([wiki](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf))
- python ([wiki](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python))

