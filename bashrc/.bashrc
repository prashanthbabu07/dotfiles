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
fastfetch


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

if command -v systemctl >/dev/null 2>&1; then
    if ! systemctl --user is-active ssh-agent.service >/dev/null 2>&1; then
        systemctl --user start ssh-agent.service
    fi
else
    echo "systemctl command not found, skipping ssh-agent service check."
fi
# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval "$(ssh-agent -s)"
# fi
