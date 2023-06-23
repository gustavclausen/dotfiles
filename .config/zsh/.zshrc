# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# STYLING
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="common"
DISABLE_AUTO_TITLE="true" # Disable auto-setting terminal title
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
)

source $ZSH/oh-my-zsh.sh

COMMON_COLORS_CURRENT_DIR=green

ctx() {
  if [[ $AWS_VAULT ]]; then
    echo -n "%{$fg[$COMMON_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT ❯%{$reset_color%} "
  fi

  if [[ (( $+commands[kubectl] )) ]]; then
      local current_ctx=$(kubectl config current-context 2> /dev/null)

      if [[ -n "$current_ctx" ]]; then
        echo -n "%{$fg[cyan]%}$current_ctx ❯%{$reset_color%} "
      fi
  fi
}

PROMPT='$(ctx)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# COMMAND-LINE TOOLS
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<

eval "$(/opt/homebrew/bin/brew shellenv)"

# GNU instead of FreeBSD tools for consistency :-)
BREW_BIN="/opt/homebrew/bin/brew"
if type "${BREW_BIN}" &>/dev/null; then
    # shellcheck disable=SC2155
    export BREW_PREFIX="$("${BREW_BIN}" --prefix)"
    for bindir in "${BREW_PREFIX}/opt/"*"/libexec/gnubin"; do export PATH=$bindir:$PATH; done
    for bindir in "${BREW_PREFIX}/opt/"*"/bin"; do export PATH=$bindir:$PATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/share/man/man1"; do export MANPATH=$mandir:$MANPATH; done
fi

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# DEFAULTS
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
export VISUAL=nvim;
export EDITOR=nvim;

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ALIASES
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
alias rr=". ranger"
alias vim="nvim"
alias lg="lazygit"
alias ks="switch"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# PROGRAMMING
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
export GOPATH="$HOME/go"
export PATH="$GOPATH:$HOME/go/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# MISC
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
eval $(thefuck --alias)
. "$(brew --prefix asdf)/libexec/asdf.sh"
INSTALLATION_PATH=$(brew --prefix switch) && source $INSTALLATION_PATH/switch.sh

autoload bashcompinit
bashcompinit
source ~/.bash_completion
