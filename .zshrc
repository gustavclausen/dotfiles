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
)

SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_SECTIONS="$HOME/.spaceship-prompt-sections"
for prompt_section in `ls -1 $SPACESHIP_PROMPT_SECTIONS/*.zsh`
do
    source $prompt_section
done
SPACESHIP_RPROMPT_ORDER=(ranger)

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

# SDK & languages
export JAVA_HOME="/usr/local/opt/openjdk"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH:$GOPATH/bin:$JAVA_HOME/bin

# Shell utils
eval $(thefuck --alias)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Program aliases
alias rr=". ranger"
alias tf="terraform"
alias typora="open -a typora"

# Git aliases
alias copy_branch_name="echo -n \$(git branch --show-current) | pbcopy"
alias merge_with_master="git checkout master && git pull && git checkout - && git merge -"
alias pcr="pre-commit run --all-files"
alias gor="cd \$(git root)"
alias repo_web="gh repo view --web"
