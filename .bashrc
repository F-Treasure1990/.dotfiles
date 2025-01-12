######################################################################
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
######################################################################

iatest=$(expr index "$-" i)


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines in the history and do not add lines that start with a space
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000
HISTTIMEFORMAT="%F %T " # Add data and time formatting to bash history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set to Vi mode
set -o vi
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias open='xdg-open'
alias nv='nvim'
alias tm='tmux'
alias fzf='fzf --preview "bat --style=numbers --color=always {}"'

alias cj='NVIM_APPNAME=cj nvim'

## File Movement
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# File Aliases
alias bashrc='nv ~/.bashrc'
alias desk='cd ~/Desktop'
alias dev='cd ~/Developer'
alias fonts='cd ~/.local/share/fonts'


# Git
alias lg='lazygit'
alias pn="pnpm"
alias pnx="pnpx"

# System
alias logs="cd /var/log"


# if neofetch exists, run it
if [[ -z "$TMUX" ]]; then
  if command -v neofetch &> /dev/null; then neofetch; fi
fi

eval "$(starship init bash)"
eval "$(zoxide init bash)"
PS1='[\u@\h \W]\$ '

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

# pnpm
export PNPM_HOME="/home/fenton/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
