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
    vi-mode
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
export LDFLAGS="-L/opt/homebrew/opt/llvm@13/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@13/include"
export VISUAL=vim
export EDITOR=vim

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ALIASES
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
alias rr=". ranger"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# PROGRAMMING
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
export PATH="$HOME/go:$HOME/go/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# MISC
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<
eval $(thefuck --alias)
