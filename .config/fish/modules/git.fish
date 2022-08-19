alias g="git"

alias gc="git commit"
alias gl="git log --graph --abbrev-commit --decorate --date=relative -10 --format=format:'%C(bold blue)%h%C(reset) %C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(green)(%ar)%C(reset) %C(dim white)- %an%C(reset)'"
alias gp="git push"
alias gs="git status"
alias gd="git diff"

function gb
    echo "Check if branch "$argv" exist"
    if not git checkout $argv
        echo "$argv not exist! Creating new branch."
        git checkout -b $argv
    end
end

alias conf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
