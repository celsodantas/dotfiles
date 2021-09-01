# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
local git_status="$(~/dotfiles/bin/git-cwd-info)"
local spin_prefix=""

if [ $SPIN ]; then 
  spin_prefix="%{$fg[green]%}[SPIN]%{$reset_color%} "
fi

PROMPT='
${spin_prefix}%~ $(~/dotfiles/bin/git-cwd-info)
${smiley}  %{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit
