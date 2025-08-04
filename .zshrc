# Minimal prompt: just current folder and %
PROMPT='%1~ %# '

#print empty line before each prompt for better readability
precmd() { echo ""; }

source ~/repos/dotfiles/.zsh_aliases
