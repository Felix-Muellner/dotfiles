# =========================
# Basic setup
# =========================
# Load aliases
source ~/repos/dotfiles/.zsh_aliases

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
PROMPT=$'\n=====================================================================================================================\n''%1~ ${vcs_info_msg_0_} %# '
