function npmlgn --description "npm list global with custom depth"
    if test (count $argv) -eq 0
        echo "Usage: npmlgn <depth>" >&2
        return 1
    end
    npm list -g --depth $argv[1]
end
