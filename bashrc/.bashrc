#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# export WLR_NO_HARDWARE_CURSORS=1
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export GBM_BACKEND=nvidia-drm
# export LIBVA_DRIVER_NAME=nvidia



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load the fastfetch script
# fastfetch


# ALIAS's
alias ll='ls -la'


# History settings
HISTSIZE=10000
HISTFILESIZE=10000000

# completion settings
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# start ssh-agent if not already running using systemctl user

# if command -v systemctl >/dev/null 2>&1; then
#     if ! systemctl --user is-active ssh-agent.service >/dev/null 3>&1; then
#         systemctl --user start ssh-agent.service
#     fi
# else
#     echo "systemctl command not found, skipping ssh-agent service check."
# fi
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi

# Add mason to PATH for mason package manager
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

export PATH="$PATH:$HOME/.dotnet/tools"


# Prompt
# Load the git prompt script (Standard Arch path)
# Ensure the git prompt script is loaded
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

# Git prompt settings
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true

# Constructing the PS1
# \[...\] prevents line wrapping bugs
# \u = username | \W = current folder | \e[1;...m = Bold Colors

# 1. Username (Bold Green) + First Arrow (Bold Blue)
PS1='\[\e[1;32m\]\u\[\e[0m\] \[\e[1;34m\]→\[\e[0m\] '

# 2. Current Directory (Bold Blue)
PS1+='\[\e[1;34m\]\W\[\e[0m\] '

# 3. Git Branch (Bold Red) - only shows when in a git repo
PS1+='\[\e[1;31m\]$(__git_ps1 " → (%s)")\[\e[0m\] '

# 4. Final Arrow (Bold Magenta)
PS1+='\[\e[1;35m\]→\[\e[0m\] '
