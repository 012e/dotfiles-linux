_alias II "sudo pacman -S --needed"
_alias RR "sudo pacman -Rs"
_alias UU "sudo pacman -Syyu"
_alias CC 'echo "Clean up orphan packages" && sudo pacman -Rs (pacman -Qtdq) && echo "Clean cache" && sudo pacman -Sc'
