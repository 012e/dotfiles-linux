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
_alias gs "git status"
_alias gd "git diff"
_alias gb git_smart_checkout


alias conf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
