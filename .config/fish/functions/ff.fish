function ff
    set -l dest (dirname (fd | fzf-popup))
    if test "$dest" != ""
        cd $dest
    end
end
