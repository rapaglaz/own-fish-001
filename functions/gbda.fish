function gbda --description "Delete merged branches"
    git branch --no-color --merged | grep -vE "^([+*]|\s*(main|master|develop|development)\s*\$)" | xargs git branch --delete 2>/dev/null
end
