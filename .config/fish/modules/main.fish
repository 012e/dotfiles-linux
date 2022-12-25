source $HOME/.config/fish/modules/utils.fish

fish_default_key_bindings

set -l config_path "$HOME/.config"

# ENV vars
_env_var GOPATH "$HOME/.local/share/go/"
_env_var EDITOR nvim
_env_var MANPAGER "sh -c 'col -bx | bat -l man -p'"
_env_var XDG_DOWNLOAD_DIR "$HOME/down"
_env_var GIT_CONFIG_GLOBAL "$config_path/git/config"

# Dependencies
_import exa pacman syspower keybindings nvim fzf git z fishtheme

set fish_greeting

# Random useful things 
# aliases/functions

_alias rip "killall"
_alias ... "cd ../../"
_alias .... "cd ../../../"
_alias pyenv "source ./venv/bin/activate.fish"
alias rm "trash-put"
trap "begin tmux kill-session -t $fish_pid; tmux kill-session -t popup$fish_pid; end &> /dev/null" EXIT
