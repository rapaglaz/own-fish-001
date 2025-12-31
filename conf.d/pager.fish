status is-interactive || return

# bat configuration
if command -q bat
    # man pages
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT -c
end
