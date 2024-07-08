# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"

# Load and initialise completion system
autoload -Uz compinit
compinit

#Keybind 
bindkey '^[[B' history-substring-search-down
bindkey '^[[A' history-substring-search-up

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Load the zsh files
for file in $ZSHDOTDIR/*.zsh; do
    source "$file"
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
