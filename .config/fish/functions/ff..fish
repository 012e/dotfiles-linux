function ff.
    set -l dest (dirname (fd -H | fzf))
    if test "$dest" != ""
        cd $dest
    end
end
