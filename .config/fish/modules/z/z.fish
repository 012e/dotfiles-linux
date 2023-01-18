function zv
    z $argv
    v
end

function z
    zmove $argv && clear && echo $PWD && ls
end
