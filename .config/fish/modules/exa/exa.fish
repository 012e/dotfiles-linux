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
    # echo ($total_arg -eq 0)
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
    # echo ($total_arg -eq 0)
end
