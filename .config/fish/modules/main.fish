source $HOME/.config/fish/modules/utils.fish

fish_default_key_bindings

# ENV vars
_env_var GOPATH "$HOME/.local/share/go/"
_env_var THEME gruvbox
_env_var EDITOR nvim
_env_var MANPAGER "sh -c 'col -bx | bat -l man -p'"
_env_var XDG_DOWNLOAD_DIR "$HOME/files"

# Dependencies
_import exa pacman syspower keybindings nvim fzf git dwmbar z

# Starups
starship init fish | source
set fish_greeting

# Random useful things 
# aliases/functions

alias rip="killall"
alias ...="cd ../../"

# prevent script to die on terminal close

trap "tmux kill-session -t $fish_pid; tmux kill-session -t popup$fish_pid" EXIT
