HISTSIZE=100000
HISTFILESIZE=100000
HISTFILE=~/.zsh_history

setopt autocd

source $HOME/.shortcuts # Load shortcut aliases
source $HOME/.aliases

vf() { $EDITOR $(fzf) ;}

# Zsh theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color '#88c0d0'
zstyle ':prompt:pure:prompt:*' color '#5e81ac'
zstyle :prompt:pure:git:branch color '#b48ead'
zstyle :prompt:pure:git:dirty color '#d08770'
prompt pure

# Plugins
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# Zsh keybindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^U' backward-kill-line
bindkey '^R' history-incremental-search-backward

# Enable colors and change prompt:
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

pfetch
