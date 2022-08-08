alias glog="git log --graph --pretty='format:%C(yellow)%h%C(cyan)%d%Creset %s => %C(green)%an%C(white), %C(red)%ar%Creset'"
alias gca="git add --all && git commit -a"
alias c='cd'
alias gl="git log --graph --pretty='format:%C(yellow)%h%C(cyan)%d%Creset %s => %C(green)%an%C(white), %C(red)%ar%Creset'"
alias gs="git status"
alias g='git'
alias gd="git diff"
alias gdd="git diff --cached"
alias gdt="git difftool"
alias ber="bundle exec rails"
alias be="bundle exec"
alias ctags_build="ctags -R -f .tags"
alias tmux="TERM=screen-256color-bce tmux"
alias bake="bundle exec rake"
alias buby="bundle exec ruby"
alias btest='bundle exec ruby -I.:test -e "ARGV.each{|f| require f}"'
alias vs="cd ~/Code/vagrant && vagrant ssh"
alias vu="vagrant up"
alias vs="cd ~/Code/Ruby/vagrant && vagrant ssh"

# making ag search to use LESS as pager, so multipage results can be paged in the terminal
alias ag='\ag --pager="less -XFR"'

alias vim=nvim
