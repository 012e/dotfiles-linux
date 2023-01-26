function cf
    set -l dest (fd --type d | fzf)
    if test "$dest" != "" 
        cd $dest
    end
end
