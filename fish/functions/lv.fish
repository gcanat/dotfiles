function lv --wraps='vim $(rg --files ./ | fzf --multi --height 40% --reverse)' --description 'select file with fzf and open in vim'
  vim $(rg --files ./ | fzf --multi --height 40% --reverse)
        
end
