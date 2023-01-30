function cf.
    set -l dest (fd -H --type d | fzf-popup)
    if test "$dest" != "" 
        cd $dest
    end
end
