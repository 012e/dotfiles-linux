function ff.
    set -l dest (dirname (fd -H | fzf-popup))
    if test "$dest" != ""
        cd $dest
    end
end
