function z
    zmove $argv && clear && echo $PWD && ls
end

function zv
    z $argv
    v
end

