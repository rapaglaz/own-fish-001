function bremove --description "Remove Homebrew formula and its unused dependencies"
    if test (count $argv) -eq 0
        echo "Usage: bremove <formula>" >&2
        return 1
    end

    set -l formula $argv[1]
    set -l deps (brew deps $formula 2>/dev/null)

    brew uninstall $formula
    and if test -n "$deps"
        echo $deps | xargs brew remove --ignore-dependencies
    end
    and brew missing | cut -d: -f2 | sort | uniq | xargs brew install
    and brew cleanup
end
