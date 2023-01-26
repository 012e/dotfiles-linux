function ff
    set -l dest (dirname (fd | fzf))
    if test "$dest" != ""
        cd $dest
    end
end
