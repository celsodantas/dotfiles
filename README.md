# Requirements

* Homebrew [brew.sh/](https://brew.sh/)
* Oh My Zsh [github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

# Instalation

Clone the project:

```
git clone git@github.com:celsodantas/dotfiles.git ~/dotfiles
```

Now create symlinks to it:

```
cd ~/dotfiles && ./install.sh
```

Now copy the theme under the `~/dotfiles/zsh/themes/dantas.zsh-theme` to `~/.oh-my-zsh/themes`.

```
cp ~/dotfiles/zsh/themes/dantas.zsh-theme ~/.oh-my-zsh/themes
```

# Mac OS changes

Enable the key repetition on hold (need to restart the Mac):

    defaults write -g ApplePressAndHoldEnabled -bool false


enjoy!

