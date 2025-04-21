function fzf_open
    set -l path (fd . --type=f | fzf --no-sort)
    echo
    if test "$path" != ""
        open "$path"
    else 
        echo "No file selected"
    end
    commandline -f repaint
end
