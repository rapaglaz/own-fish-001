status is-interactive || return

# Coreutils
if command -q gsed
    abbr -a sed gsed
end

if command -q gdate
    abbr -a date gdate
end

if command -q gstat
    abbr -a stat gstat
end

if command -q gxargs
    abbr -a xargs gxargs
end

# Bat
if command -q bat
    abbr -a cat bat --paging=never --plain
end

# Prefer eza, fallback to gls, fallback to ls
if command -q eza
    set -g __ls_cmd eza
    set -g __ls_group_dirs --group-directories-first
else if command -q gls
    set -g __ls_cmd gls
    set -g __ls_group_dirs --group-directories-first
else
    set -g __ls_cmd ls
    set -g __ls_group_dirs ""
end

# Base
abbr -a l $__ls_cmd
abbr -a ll $__ls_cmd -l $__ls_group_dirs
abbr -a la $__ls_cmd -a $__ls_group_dirs
abbr -a lla $__ls_cmd -la $__ls_group_dirs

# Git-aware (only eza supports this; harmless no-op for ls/gls)
abbr -a lg $__ls_cmd --git

# Sorting
abbr -a lS $__ls_cmd -l --sort=size --reverse $__ls_group_dirs
abbr -a lM $__ls_cmd -l --sort=modified --reverse $__ls_group_dirs
abbr -a lC $__ls_cmd -l --sort=created --reverse $__ls_group_dirs
abbr -a lA $__ls_cmd -l --sort=accessed --reverse $__ls_group_dirs

# Sorting (include hidden files)
abbr -a lSa $__ls_cmd -la --sort=size --reverse $__ls_group_dirs
abbr -a lMa $__ls_cmd -la --sort=modified --reverse $__ls_group_dirs
abbr -a lCa $__ls_cmd -la --sort=created --reverse $__ls_group_dirs
abbr -a lAa $__ls_cmd -la --sort=accessed --reverse $__ls_group_dirs

abbr -a rm rm -i
abbr -a grep grep --color=auto
abbr -a wcat wget -q -O -

abbr -a reload exec fish

# rg
if command -q rg
    abbr -a rgc rg -c
    abbr -a rgi rg -i
    abbr -a rgl rg -l
    abbr -a rgw rg -w
    abbr -a rgh rg --hidden
end

# Zoxide shortcuts - only if zoxide is initialized in config.fish
abbr -a zz z -
abbr -a zq zoxide query
abbr -a za zoxide add
abbr -a zr zoxide remove

# Brew
abbr -a bsearch brew search
abbr -a binstall brew install
abbr -a bupgrade brew upgrade --greedy
abbr -a bdoctor brew doctor
abbr -a bmiss brew missing
abbr -a blist brew list
abbr -a bdump brew bundle dump -f --casks --taps --brews --file=$HOME/.config/Brewfile
abbr -a binfo brew info
