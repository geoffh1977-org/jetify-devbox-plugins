#!/usr/bin/env bash

# Environment Variables
export TERM="xterm-256color"
export DOCKER_BUILDKIT="1"
export EDITOR="vim"
export VISUAL="${EDITOR}"

# Add Local Binaries To Path
export PATH="$HOME/.local/bin:$PATH"

# Setup Shell Specific Settings
# [[ "$(basename "${SHELL}")" == "zsh" ]] && source /home/devbox/.local/bin/zsh-config.sh

# Initialize Starship Prompt
eval "$(starship init zsh)"

# Configure Aliases
alias l='ls -alh'
alias la='eza -lah --color=always --group-directories-first'
alias ll='eza -lh --color=always --group-directories-first'
alias lla='eza -la'
alias ls='eza -lh --color=always --group-directories-first'
alias lt='eza -aTh --color=always --group-directories-first'

alias cat='bat -pp'

alias du='dust'

alias more='less'

alias zip='7z a -tzip'
alias unzip='7z x'
alias unrar='7z x'

alias tmux='tmux has-session 2>/dev/null && tmux -u attach || tmux -u'

# Remove All Git Braches Except Main
alias gbd='git branch | grep -v "main" | xargs git branch -D'
