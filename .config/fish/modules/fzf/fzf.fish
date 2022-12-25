function cf
    set -l dest (fd --type d | fzf)
    if [ "$dest" != "" ]
        cd $dest
    end
end

function cf.
    set -l dest (fd -H --type d | fzf)
    if [ "$dest" != "" ]
        cd $dest
    end
end

function ff
    set -l dest (dirname (fd | fzf))
    if [ "$dest" != "" ]
        cd $dest
    end
end

function ff.
    set -l dest (dirname (fd -H | fzf))
    if [ "$dest" != "" ]
        cd $dest
    end
end
