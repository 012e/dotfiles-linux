function __work
    if set -l git_root (git rev-parse --show-toplevel 2>/dev/null) && test -e $git_root/vimsession.vim
        nvim -S $git_root/vimsession.vim
    else
        nvim +"Telescope find_files"
    end
end

bind -k f5 __work
