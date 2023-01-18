function __git_up_to_date
     git status -uno 2>/dev/null | rg "up to date" >/dev/null
end

function __in_git_repo
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
end

function __git_stash_count
    git stash list 2>/dev/null | wc -l
end

function __git_changed
    test (git status -s)!="" >/dev/null 2>&1
end

function __in_git_rebase
    git rebase --show-current-patch >/dev/null 2>&1
end

function __in_git_merge
    git status | rg "merging" >/dev/null >&1
end

function fish_title
    set title (prompt_pwd)
    if __in_git_repo
        if not __git_up_to_date
            set title "[pull?]"$title
        end
        if [ (__git_stash_count) != "0" ]
            set title "[stash]"$title
        end
        if __git_changed
            set title "[changed]"$title
        end
        set title "["(git branch --show-current)"]"$title
        if __in_git_rebase
            set title "[REBASING]"$title
        end
        if __in_git_merge
            set title "[MERGING]"$title
        end
    end
    echo $title
end

function fish_prompt
    set command_status $status
    set_color $fish_color_cwd
    echo -n (prompt_pwd) 
    if not test $command_status -eq 0
        set_color red
        echo -n " [$command_status]"
    end
    set_color normal
    echo -n " ❯ "
end
