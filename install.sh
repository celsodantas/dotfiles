# Installing Oh My zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Recreating the aliases
rm ~/.zshrc 		 && ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
rm ~/.gitconfig  && ln -s ~/dotfiles/gitconfig ~/.gitconfig
rm ~/.githelpers && ln -s ~/dotfiles/githelpers ~/.githelpers
rm ~/.pryrc 		 && ln -s ~/dotfiles/pryrc ~/.pryrc

# setup nvim if .config doesn't exist
if [ ! -d ~/.config/ ]; then 
	mkdir -p ~/.config/
	ln -s ~/dotfiles/vim ~/.config/nvim
fi

# Installing the ZSH theme
cp ~/dotfiles/zsh/themes/dantas.zsh-theme ~/.oh-my-zsh/themes

cd ~/dotfiles

# Downloading submodules
git submodule init
git submodule update --recursive

# SPIN - Shopify specific
if [ $SPIN ]; then
	sudo apt-get install -y ctags
	sudo apt-get install -y fzf
	sudo apt-get install -y ripgrep
	sudo apt-get install -y nodejs
	sudo apt-get install -y fd-find

	sudo ln -s $(which fdfind) /usr/bin/fd # allowing fd usage instead of fdfind
else
	# brew stuff
	brew install fd
	brew install bat
	brew install node
	brew install diff-so-fancy
	brew install ag
	brew install ripgrep
	brew install ctags
	brew install reattach-to-user-namespace  # required for tmux

	brew install fzf
	$(brew --prefix)/opt/fzf/install
fi

npm install -g tldr
