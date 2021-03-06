#!/bin/bash
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export DOTFILES="$HOME/dotfiles"
# PIX is here I have LARBS keep icons. Subject to change, hence a variable.
export PIX="$HOME/.scripts/pix"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# font config for chinese inputs
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Intellij grey screen fix
export _JAVA_AWT_WM_NONREPARENTING=1


[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

# Start graphical server if bspwm not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx

# Switch escape and caps and use wal colors if tty:
# sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# For QT to use GTK 2 theme
QT_QPA_PLATFORMTHEME=gtk2

# For doing npm -g without perm issue
export NPM_CONFIG_PREFIX=~/.npm-global

