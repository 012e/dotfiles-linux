function fish_remove_path
    echo "Select one of the below:"
    echo $fish_user_paths | tr " " "\n" | nl
    read --prompt-str="Remove entry number> " target
    set --erase --universal fish_user_paths[$target]
end
