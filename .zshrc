# Source shell prompt configuration
source ~/.shell_prompt.sh

# Source bash config for compatibility
if [ -f ~/.bash_config ]; then
    source ~/.bash_config
fi

# Source git-chord for vim-style composable git commands
if [ -f ~/.git-chord/git-chord.zsh ]; then
    source ~/.git-chord/git-chord.zsh
fi
