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
set -l __ls_cmd ls
set -l __ls_group_dirs

if command -q eza
    set __ls_cmd eza
    set __ls_group_dirs --group-directories-first
else if command -q gls
    set __ls_cmd gls
    set __ls_group_dirs --group-directories-first
end

# Base
abbr -a l $__ls_cmd
abbr -a ll $__ls_cmd -l $__ls_group_dirs
abbr -a la $__ls_cmd -a $__ls_group_dirs
abbr -a lla $__ls_cmd -la $__ls_group_dirs

# Git-aware (eza only)
if command -q eza
    abbr -a lg eza --git $__ls_group_dirs
end

# Files only (eza: --only-files; gls/ls: pipe out dirs)
if command -q eza
    abbr -a lf eza --only-files $__ls_group_dirs
    abbr -a lfl eza --only-files -l $__ls_group_dirs
    abbr -a lfa eza --only-files -a $__ls_group_dirs
    abbr -a lfla eza --only-files -la $__ls_group_dirs
    abbr -a lfS eza --only-files -l --sort=size --reverse $__ls_group_dirs
    abbr -a lfM eza --only-files -l --sort=modified --reverse $__ls_group_dirs
    abbr -a lfC eza --only-files -l --sort=created --reverse $__ls_group_dirs
    # Dirs only
    abbr -a lD eza --only-dirs $__ls_group_dirs
    abbr -a lDl eza --only-dirs -l $__ls_group_dirs
    abbr -a lDa eza --only-dirs -a $__ls_group_dirs
end

# Sorting
if command -q eza
    # eza supports all four sort keys
    abbr -a lS eza -l --sort=size --reverse $__ls_group_dirs
    abbr -a lM eza -l --sort=modified --reverse $__ls_group_dirs
    abbr -a lC eza -l --sort=created --reverse $__ls_group_dirs
    abbr -a lA eza -l --sort=accessed --reverse $__ls_group_dirs
    abbr -a lSa eza -la --sort=size --reverse $__ls_group_dirs
    abbr -a lMa eza -la --sort=modified --reverse $__ls_group_dirs
    abbr -a lCa eza -la --sort=created --reverse $__ls_group_dirs
    abbr -a lAa eza -la --sort=accessed --reverse $__ls_group_dirs
else
    # gls/ls: -S (size largest first), -t (modified newest first)
    abbr -a lS $__ls_cmd -lS $__ls_group_dirs
    abbr -a lM $__ls_cmd -lt $__ls_group_dirs
    abbr -a lSa $__ls_cmd -lSa $__ls_group_dirs
    abbr -a lMa $__ls_cmd -lta $__ls_group_dirs
end

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

# Zoxide shortcuts
if command -q zoxide
    abbr -a zz z -
    abbr -a zq zoxide query
    abbr -a za zoxide add
    abbr -a zr zoxide remove
end

# Brew
abbr -a bsearch brew search
abbr -a binstall brew install
abbr -a bupgrade brew upgrade
abbr -a bdoctor brew doctor
abbr -a bmiss brew missing
abbr -a blist brew list
abbr -a bdump brew bundle dump -f --casks --taps --brews --file=$HOME/.config/Brewfile
abbr -a binfo brew info
