#   ___  _  _   __  ____   __  _______ _  _
#  / _ \| || | |  \/  \ \ / / |_  / __| || |
# | (_) | __ | | |\/| |\ V /   / /\__ \ __ |
#  \___/|_||_| |_|  |_| |_|   /___|___/_||_|

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Settings
ZSH_THEME="spaceship"
DISABLE_AUTO_TITLE="true" # Disable auto-setting terminal title.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  vi-mode
  history
)

SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VI_MODE_SHOW=true

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh

#  ___ _  _ ___ _    _      ___  ___ ___ _  _   _ _  _____ ___
# / __| || | __| |  | |    |   \| __| __/_\| | | | ||_   _/ __|
# \__ \ __ | _|| |__| |__  | |) | _|| _/ _ \ |_| | |__| | \__ \
# |___/_||_|___|____|____| |___/|___|_/_/ \_\___/|____|_| |___/

export VISUAL=vim;
export EDITOR=vim;

#   ___ _   _ ___ _____ ___  __  __
#  / __| | | / __|_   _/ _ \|  \/  |
# | (__| |_| \__ \ | || (_) | |\/| |
#  \___|\___/|___/ |_| \___/|_|  |_|

# Shell utils
eval $(thefuck --alias)

# SDK & languages
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="$HOME/go:$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export JAVA_HOME="/usr/local/opt/openjdk@8"

# Program aliases
alias rr=". ranger"
