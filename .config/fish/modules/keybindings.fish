function __work
    if set -l git_root (git rev-parse --show-toplevel 2>/dev/null) && test -e $git_root/vimsession.vim
        printf "set laststatus=0\nset cmdheight=0\n" >> vimsession.vim
        nvim -S $git_root/vimsession.vim 2>/dev/null
    else
        nvim +"Telescope find_files"
    end
end

bind -k f5 __work
