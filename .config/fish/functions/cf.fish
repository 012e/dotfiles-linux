function cf
    set -l dest (fd --type d | fzf-popup)
    if test "$dest" != "" 
        cd $dest
    end
end
