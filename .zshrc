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

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# COMMAND-LINE TOOLS
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
