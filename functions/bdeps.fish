function bdeps --description "Show dependencies for all installed Homebrew formulas"
    brew list --formula -1 | while read -l cask
        set_color -o blue
        echo -n " $cask "
        set_color normal
        brew uses $cask --installed | awk '{printf(" %s ", $0)}'
        echo ""
    end
end
