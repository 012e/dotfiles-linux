function v
  if not git rev-parse --git-dir &> /dev/null
    nvim $argv
    return
  end

  set -l git_path (git rev-parse --show-toplevel 2> /dev/null)
  if test -d $git_path/.$PROJECT_PATH
    set my_project_path $git_path/.$PROJECT_PATH
  else 
    set my_project_path $git_path/$PROJECT_PATH
  end

  set -l vim_target "$my_project_path/nvim.vim"
  set -l lua_target "$my_project_path/nvim.lua"

  test -e "$vim_target"
  set -l have_vim $status

  test -e "$lua_target"
  set -l have_lua $status

  if test "$have_lua" = 0 && test "$have_vim" = 0
    nvim $argv -c "source $vim_target | luafile $lua_target"
  else if test "$have_lua" = 0
    nvim $argv -c "luafile $lua_target"
  else if test "$have_vim" = 0
    nvim $argv -c "source $vim_target"
  else
    nvim $argv
  end
end
