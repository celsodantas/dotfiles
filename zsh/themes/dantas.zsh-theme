# Colors
autoload -U colors
colors
setopt prompt_subst

if [ $SPIN ]; then
  spin_prefix="%{$fg[green]%}[SPIN]%{$reset_color%} "
  PROMPT='${spin_prefix} %{$fg[cyan]%}%~%{$reset_color%} (%{$fg[yellow]%}$(git_current_branch)%{$reset_color%})
➜ '
else
  PROMPT='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}
➜ "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✗"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
fi
# PROMPT='
# ${spin_prefix}%~ $(~/dotfiles/bin/git-cwd-info)
# ${smiley}  %{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit
