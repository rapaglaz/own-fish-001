function gbds --description "Delete squashed and merged branches"
    # Determine default branch
    set -l default_branch (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
    if test -z "$default_branch"
        set default_branch main
    end

    git for-each-ref refs/heads/ --format='%(refname:short)' | while read -l branch
        set -l merge_base (git merge-base $default_branch $branch)
        if test -n "$merge_base"
            set -l cherry_result (git cherry $default_branch (git commit-tree (git rev-parse $branch\^{tree}) -p $merge_base -m _))
            if string match -q -- '-*' $cherry_result
                git branch -D $branch
            end
        end
    end
end
