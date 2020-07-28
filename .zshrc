HISTSIZE=100000
HISTFILESIZE=100000
HISTFILE=~/.zsh_history

source $HOME/.shortcuts # Load shortcut aliases

alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

alias v="nvim"
alias vim="nvim"
alias sv="sudo vim"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias ref="shortcuts && source ~/.zshrc" # Refresh shortcuts manually and reload zshrc
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
alias yc="yay -Yc"
alias cdgo="cd /home/yuu/dev/golang"
alias vc="sudo protonvpn c"
alias vd="sudo protonvpn d"
alias psql="psql -h /home/yuu/postgres/data/postgresql"
alias vboxstart="vboxmanage startvm"
alias vboxlist="vboxmanage list vms"

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias capture="xclip -selection clipboard -t image/png -i"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# GDB
alias gdbbt="gdb --batch --ex run --ex bt --ex q --args"

# Kali
alias kali="tmux new-session -d -s kali 'vmplayer /home/yuu/Downloads/kali-linux-2020-2a-vmware-amd64-7z/kali-linux-2020.2a-vmware-amd64/Kali-Linux-2020.2a-amd64.vmwarevm/Kali-Linux-2020.2a-vmware-amd64.vmx'"

# Capture
alias scrot="scrot -q 100"
alias scrots="scrot -q 100 -s"

# checkip
alias checkip="curl https://ipinfo.io/ip && curl https://ipinfo.io/country"

# reset wall paper
alias wall="feh --bg-scale ~/.config/wall.jpg"

alias resetkeys="setxkbmap"
alias resetbar="~/.config/polybar/launch.sh"
vf() { $EDITOR $(fzf) ;}

export PATH=$PATH:/opt/anaconda/bin
export GOPATH=/home/yuu/dev/golang
export GOBIN=/home/yuu/dev/golang/bin
export PATH=$PATH:$GOBIN

# Zsh theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color '#84a0c6'
zstyle ':prompt:pure:prompt:*' color '#d2d4de'
zstyle :prompt:pure:git:branch color '#95c4ce'
zstyle :prompt:pure:git:dirty color '#e9b189'
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
