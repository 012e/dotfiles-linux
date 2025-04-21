function open
  echo "Opening $argv with type " (xdg-mime query filetype $argv)
  xdg-open $argv &> /dev/null
end
