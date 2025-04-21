function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
  if set --query TMUX
    fzf-tmux -w 50% -h 80% -m -- $argv
  else
    command fzf $argv
  end
end
