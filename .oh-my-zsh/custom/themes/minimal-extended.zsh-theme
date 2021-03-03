# Based on: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/minimal.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!%{$fg[white]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%}"

# Gets the number of commits ahead from remote
git_commits_ahead() {
  if command git rev-parse --git-dir &>/dev/null; then
    local commits="$(git rev-list --count @{upstream}..HEAD)"
    if [[ "$commits" != 0 ]]; then
      echo "%{$fg[green]%}▲%{$fg[white]%} $commits "
    fi
  fi
}

PROMPT='- %2~ $(git_prompt_info)$(git_commits_ahead)›%b '
