status is-interactive || return

# Remove welcome message
set -g fish_greeting

if command -q mise
    mise activate fish | source
end

if command -q atuin
    atuin init fish --disable-up-arrow | source
end

if command -q zoxide
    zoxide init fish | source
end

if command -q starship
    starship init fish | source
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
