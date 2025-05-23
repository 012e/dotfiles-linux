# ENV vars {{{
#direnv hook fish | source # setup direnv
function _env_var -a env value
    set -gx $env $value
end
set config_path "$HOME/.config"
_env_var  AWESOME_THEMES_PATH        "$config_path/awesome/themes"                                  
_env_var  BROWSER                    "firefox"                                                           
_env_var  EDITOR                     "nvim"                                                           
_env_var  GIT_CONFIG_GLOBAL          "$config_path/git/config"                                      
_env_var  GOPATH                     "$HOME/.local/share/go/"                                       
_env_var  GTK_USE_PORTAL             "1"
_env_var  MANPAGER                   "sh -c 'col -bx | bat -l man -p'"
_env_var  MANROFFOPT                 "-c"
_env_var  PROJECT_PATH               ".huyproject"
_env_var  XDG_DOWNLOAD_DIR           "$HOME/down"                                                   
_env_var _JAVA_AWT_WM_NONREPARENTING 1
_env_var GEM_HOME                    "$HOME/.local/share/gem"
# set -U Z_AFTER 'clear && echo $PWD && ls'
# }}}

function _alias
    abbr --add -g $argv[1] $argv[2..-1]
end

# misc {{{
function __nvim_marks
    nvim +'lua require("harpoon.ui").toggle_quick_menu()'
end


bind \cO fzf_open
bind \e\[15\;5~ __nvim_marks
bind \n "down-or-search"
bind \v "up-or-search"
bind \e\[29~ __nvim_find
fzf_configure_bindings --directory=\cf --variables=\cv --history=\ch
set fzf_directory_opts --preview=""
set fzf_history_opts --preview=""

alias xclip "xclip -selection clipboard"
alias k "kubectl"
_alias ipy "ipython3"
# }}}

# power management {{{
_alias shutdown "shutdown now"
_alias poweroff "shutdown now"
_alias suspend "systemctl suspend"
_alias reboot "reboot"
#}}}

# package manager {{{
_alias II "sudo pacman -S --needed"
_alias RR "sudo pacman -Rns"
_alias UU "sudo pacman -Syyu"
_alias CC "sudo pacman -Sc"
# }}}

# exa {{{
# not using abbr (_alias) because it's simply too long, doesn't like it
alias ls="exa --classify --long	--grid --icons --grid \
	--no-permissions --no-user --group-directories-first"
alias l="ls"

alias ls.="ls --all"
alias l.="ls"

alias ls..="ls ../"
alias l..="ls ../"

alias ll="exa --grid --long --icons --all --group-directories-first"

# }}}
alias d=docker

# git {{{
_alias g "git"

function git_smart_checkout
    echo "Check if branch "$argv" exist"
    if not git checkout $argv
        echo "$argv not exist! Creating new branch."
        git checkout -b $argv
    end
end

_alias gc "git commit"
alias gl="git log --graph --abbrev-commit --decorate --date=relative -10 --format=format:'%C(bold blue)%h%C(reset) %C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(green)(%ar)%C(reset) %C(dim white)- %an%C(reset)'"
_alias gp "git push"
_alias gs "git status --short"
_alias gd "git diff"
alias gb git_smart_checkout


alias conf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# }}}

# starship init fish | source
# misc {{{
set fish_greeting
fish_default_key_bindings

# Random useful things 
# aliases/functions

alias sv "sudo vim"
alias screenoff "sleep 1 && xset dpms force off"

_alias ... "cd ../../"
_alias .... "cd ../../../"
alias rm "trash-put"


## needed for st terminal
trap "begin \
tmux kill-session $fish_pid; \
tmux kill-session -t $fish_pid; \
tmux kill-session -t popup$fish_pid; \
end &> /dev/null" EXIT

# needed for foot terminal
trap "begin \
tmux kill-session $fish_pid; \
tmux kill-session -t $fish_pid; \
tmux kill-session -t popup$fish_pid; \
end &> /dev/null" SIGTERM

# trap "begin \
# tmux kill-session $fish_pid; \
# tmux kill-session -t $fish_pid; \
# tmux kill-session -t popup$fish_pid; \
# end &> /dev/null" SIGKILL
# 
# # needed for kitty, foot terminal
trap "begin \
tmux kill-session $fish_pid; \
tmux kill-session -t $fish_pid; \
tmux kill-session -t popup$fish_pid; \
end &> /dev/null" SIGHUP
# }}}
# rtx activate fish | source
#pyenv init - | source

# pnpm
set -gx PNPM_HOME "/home/huy/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
fish_hybrid_key_bindings
export GEM_HOME="$HOME/.rvm/gems/ruby-3.3.1"
export GEM_PATH="$HOME/.rvm/gems/ruby-3.3.1:$HOME/.rvm/gems/ruby-3.3.1@global"
direnv hook fish | source
