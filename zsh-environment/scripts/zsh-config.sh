#!/usr/bin/env bash
# shellcheck disable=SC1091

# ZSH Fixes
#
# History options should be set in .zshrc and after oh-my-zsh sourcing.
export HISTSIZE="1000000"
export HISTFILE="/home/devbox/.config/zsh/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK

# Enabled history options
enabled_opts=(
  APPEND_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE
  HIST_SAVE_NO_DUPS SHARE_HISTORY
)
for opt in "${enabled_opts[@]}"; do
  setopt "$opt"
done
unset opt enabled_opts

# Disabled history options
disabled_opts=(
  EXTENDED_HISTORY HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS
)
for opt in "${disabled_opts[@]}"; do
  unsetopt "$opt"
done
unset opt disabled_opts

# Keyboard Fixes
bindkey  "^[[H" beginning-of-line # Fix Home Key
bindkey  "^[[F" end-of-line # Fix End Key
bindkey "^[[3~" delete-char # Fix Delete Key

# Activate Autocompletion For Zsh If In Client Path
[ -f /home/devbox/.devbox/nix/profile/default/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /home/devbox/.devbox/nix/profile/default/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /home/devbox/.devbox/nix/profile/default/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /home/devbox/.devbox/nix/profile/default/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate Autocompletion For Zsh If In Project Path
[ -f /Project/.devbox/nix/profile/default/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /Project/.devbox/nix/profile/default/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /Project/.devbox/nix/profile/default/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /Project/.devbox/nix/profile/default/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
