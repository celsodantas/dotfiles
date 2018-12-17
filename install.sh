
# Creating the aliases
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/githelpers ~/.githelpers

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

npm install -g tldr
