#PS1
export PS1='%B%{%F{red}%}%n%{%f%}->%{%F{blue}%}%1~%f%b %# '

#colors for terminal
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export TERM=xterm-256color

export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILESIZE=10000000

# brew completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# nuget package location
export NUGET_PACKAGES="/Volumes/Sandisk/SupportFiles/NuGet"
echo "Nuget Package Location: ${NUGET_PACKAGES}"

# GOPATH
export GOPATH="/Volumes/Sandisk/SupportFiles/Go"
echo "GOPATH Location: ${GOPATH}"
export PATH=$PATH:$GOPATH/bin


# Docker
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"

autoload -Uz compinit
compinit -i

# Alias
alias ll='ls -al'


# Add .NET Core SDK tools
export PATH="$PATH:/Users/prashanth/.dotnet/tools"


export PATH="/usr/local/sbin:$PATH"
