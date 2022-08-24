set fish_path $HOME/.config/fish/modules
function _import
    for mod in $argv
        # check if path is file
        if test -d $fish_path/$mod/
            source $fish_path/$mod/$mod.fish
        else
            source $fish_path/$mod.fish
        end
    end
end

function _env_var -a env value
    set -gx $env $value
end

function _argv_exist
    echo (count $argv > /dev/null)
    return (count $argv > /dev/null)
end

function _alias
    abbr --add -g $argv[1] $argv[2..-1]
end
