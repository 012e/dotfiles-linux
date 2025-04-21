function pyenv
  set -l venv_dir ""
if test -e ".venv";
    set venv_dir ".venv"
else if test -e "venv"
    set venv_dir "venv"
else
    echo "No venv found."
    return 1
end
set -l activate_dir "$venv_dir/bin/activate.fish"
echo "Sourcing $activate_dir"
source $activate_dir
end
