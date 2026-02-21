function mise-tidy --description "Clean mise cache and prune unused tools."
    mise cache clear
    mise prune
end
