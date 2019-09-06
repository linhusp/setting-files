ZSH_DISABLE_COMPFIX=true

# Use 256 colors
export TERM="xterm-256color"

# Path to oh-my-zsh
export ZSH=/home/linh/.oh-my-zsh

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Hide hostname and pcname in terminal
DEFAULT_USER=$USER

# Enable hyphen-insensitive
# _ and - will be interchangeable
# HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git zsh-autosuggestions vi-mode
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration ----------------------------------------------------------

# Manually set language environment
# export LANG=en_US.UTF-8

# Powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

# POWERLEVEL9K_VCS_GIT_ICON=''
# POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # vi_mode 
    ssh virtualenv time root_indicator context dir vcs 
    newline
    # date
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# cd to the outer directory
# function bd() {
# 	local old_dir="$PWD"
# 	for i in $(seq "${1:-1}"); do
# 		cd ..
# 	done
# 	OLDPWD="$old_dir"
# }
# export bd

# Set python virtualenv's path
export VIRTUALENVWRAPPER_PYTHON=$(which python3.6)
source /usr/local/bin/virtualenvwrapper.sh

# Enable ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
# export CLUTTER_IM_MODULE=ibus
alias py='python3'
alias plz='sudo apt'
alias co='code-insiders'
# alias code='~/.local/share/applications/code.desktop'
