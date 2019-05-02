
# Creating the aliases
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/githelpers ~/.githelpers
ln -s ~/.dotfiles/vim ~/.vim

# Installing the theme
cp ~/.dotfiles/zsh/themes/dantas.zsh-theme ~/.oh-my-zsh/themes

cd ~/.dotfiles

# Downloading submodules
git submodule init
git submodule update --recursive

# brew stuff
brew install fd
brew install bat
brew install node
brew install diff-so-fancy
brew install ag

brew install fzf
$(brew --prefix)/opt/fzf/install

npm install -g tldr

# sublime text
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.backup
ln -s ~/.dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone https://github.com/dracula/sublime.git "Dracula Color Scheme"
cd -


# install font with powerline support
open fonts/Monaco\ for\ Powerline.otf

