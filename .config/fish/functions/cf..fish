function cf.
    set -l dest (fd -H --type d | fzf)
    if test "$dest" != "" 
        cd $dest
    end
end
