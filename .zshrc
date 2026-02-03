# =========================
# Basic setup
# =========================

# Clean PATH
export PATH="$HOME/.pyenv/shims:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/Library/TeX/texbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Load aliases
source ~/repos/dotfiles/.zsh_aliases

# --- History behavior settings ---
# HIST_IGNORE_SPACE : don't save commands that start with a space
# HIST_IGNORE_DUPS  : don't save duplicate commands
# HIST_FIND_NO_DUPS : skip duplicates when searching with history expansion
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# --- Unified history file ---
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# Enable prompt expansion (needed for ${...} in PROMPT)
setopt prompt_subst

# =========================
# Completion
# =========================
autoload -Uz compinit
compinit

# =========================
# Git branch in prompt via vcs_info
# =========================
autoload -Uz vcs_info

# Configure how the branch appears (e.g., "(main)")
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# Run vcs_info before each prompt (without clobbering other precmd hooks)
vcs_precmd() { vcs_info }
precmd_functions+=(vcs_precmd)

# =========================
# Prompt
# =========================
# Separator line + current dir + git branch + prompt symbol
# Example:
# ----------------------
# odin-recipes (main) %
PROMPT=$'\n==================================================\n''%1~ ${vcs_info_msg_0_} %# '

