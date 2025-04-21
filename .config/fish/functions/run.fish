function run
  command $argv & disown &>/dev/null
  echo "Ran command $argv"
end
