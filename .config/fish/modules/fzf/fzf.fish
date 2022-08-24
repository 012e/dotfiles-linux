function _fzf_find_and_cd
    set -l dest (fd --type d | fzf)
    if [ "$dest" != "" ]
        cd $dest
    end
end

function _fzf_find_hidden_and_cd
    set -l dest (fd -H --type d | fzf)
    if [ "$dest" != "" ]
        cd $dest
    end
end

function _fzf_find_files
    set -l dest (dirname (fd | fzf))
    if [ "$dest" != "" ]
        cd $dest
    end
end

function _fzf_find_hidden_files
    set -l dest (dirname (fd -H | fzf))
    if [ "$dest" != "" ]
        cd $dest
    end
end

_alias cf _fzf_find_and_cd
_alias cf. _fzf_find_hidden_and_cd
_alias ff _fzf_find_files
_alias ff. _fzf_find_hidden_files
