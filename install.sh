# Installing Oh My zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Recreating the aliases

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bk
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bk
ln -s ~/dotfiles/gitconfig ~/.gitconfig

[ ! -f ~/.githelpers ]	&& ln -s ~/dotfiles/githelpers ~/.githelpers
[ ! -f ~/.pryrc ]				&& ln -s ~/dotfiles/pryrc ~/.pryrc

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
	if ! command -v ctags &> /dev/null; then
		sudo apt-get install -y ctags
	fi

	if ! command -v fzf &> /dev/null; then
  	sudo apt-get install -y fzf
	fi

	if ! command -v rg &> /dev/null; then
		sudo apt-get install -y ripgrep
	fi

	if ! command -v node &> /dev/null; then
		sudo apt-get install -y nodejs
	fi

	if ! command -v fdfind &> /dev/null; then
		sudo apt-get install -y fd-find
		sudo ln -s $(which fdfind) /usr/bin/fd # allowing fd usage instead of fdfind
	fi
	
	git config --global user.email celso.dantas@shopify.com
	git config --global --unset credential.helper
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
