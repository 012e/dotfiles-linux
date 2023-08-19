# ENV vars {{{
direnv hook fish | source # setup direnv
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
set -U Z_CMD "zmove"
# }}}

function _alias
    abbr --add -g $argv[1] $argv[2..-1]
end

# misc {{{
function __nvim_find
    nvim -c "Find"
end

function __nvim_marks
    nvim +'lua require("harpoon.ui").toggle_quick_menu()'
end


bind -k f5 __nvim_find
bind \e\[15\;5~ __nvim_marks
bind \n "down-or-search"
bind \v "up-or-search"
bind \e\[29~ __nvim_find
bind \cF "history-pager"

_alias pyrun "source ./venv/bin/activate.fish && python main.py" 
# }}}

# power management {{{
_alias shutdown "shutdown now"
_alias poweroff "shutdown now"
_alias suspend "systemctl suspend"
_alias reboot "reboot"
#}}}

# package manager {{{
_alias II "sudo nala install"
_alias RR "sudo nala purge"
_alias UU "sudo nala update && sudo nala upgrade"
_alias CC "sudo nala autoremove"
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

function lt
    # 4 cases: num+path, num+nothing, path+nothing, nothing+nothing
    set -l total_arg (count $argv)

    if test $total_arg -eq 0
        ls --tree --level=2
        return 0
    end

    if test $total_arg -eq 1
        if string match -qr '^[0-9]+$' $argv[1]
            ls --tree --level=$argv[1]
        else
            ls --tree --level=2 $argv[1]
        end
        return 0
    end

    ls --tree --level=$argv[1] $argv[2]
end

function lt.
    # 4 cases: num+path, num+nothing, path+nothing, nothing+nothing
    set -l total_arg (count $argv)

    if test $total_arg -eq 0
        ls. --tree --level=2
        return 0
    end

    if test $total_arg -eq 1
        if string match -qr '^[0-9]+$' $argv[1]
            ls. --tree --level=$argv[1]
        else
            ls. --tree --level=2 $argv[1]
        end
        return 0
    end

    ls. --tree --level=$argv[1] $argv[2]
end
# }}}

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
alias icat "kitten icat"

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
