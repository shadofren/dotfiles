export ZSH="/home/yuu/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

HISTSIZE=100000
HISTFILESIZE=100000

source $HOME/.shortcuts # Load shortcut aliases

alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias ref="shortcuts && source ~/.zshrc" # Refresh shortcuts manually and reload zshrc
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
alias yc="yay -Yc"
alias cdgo="cd /home/yuu/dev/golang"
alias vc="sudo protonvpn-cli -c"
alias vd="sudo protonvpn-cli -d"
alias psql="psql -h /home/yuu/postgres/data/postgresql"
alias vmplayer="sudo vmplayer &"
alias vboxstart="vboxmanage startvm"
alias vboxlist="vboxmanage list vms"

alias grep="grep --color=auto"
alias diff="diff --color=auto"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# GDB
alias gdbbt="gdb --batch --ex run --ex bt --ex q --args"

vf() { $EDITOR $(fzf) ;}

export PATH=$PATH:/opt/anaconda/bin
export GOPATH=/home/yuu/dev/golang
export GOBIN=/home/yuu/dev/golang/bin
export PATH=$PATH:$GOBIN
