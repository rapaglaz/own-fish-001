# Locale settings
set -gx LC_CTYPE en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_NUMERIC de_DE.UTF-8
set -gx LC_TIME en_US.UTF-8
set -gx LC_COLLATE en_US.UTF-8
set -gx LC_MONETARY de_DE.UTF-8
set -gx LC_MESSAGES en_US.UTF-8

# Editor
if command -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else if command -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
end

# Android
set -gx ANDROID_HOME "$HOME/.android-sdk"
set -gx ANDROID_SDK_ROOT "$HOME/.android-sdk"

# GO
set -gx GOPATH "$HOME/.go"

# PATH configuration
fish_add_path -g \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    "$ANDROID_HOME/emulator" \
    "$ANDROID_HOME/platform-tools" \
    "$ANDROID_HOME/cmdline-tools/latest/bin" \
    "$HOME/.flutter-sdk/bin" \
    "$HOME/.cabal/bin" \
    "$HOME/.ghcup/bin" \
    /opt/homebrew/bin \
    /opt/homebrew/sbin

# Homebrew
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_UPGRADE_GREEDY 1
set -gx HOMEBREW_BUNDLE_FILE "$HOME/.config/Brewfile"

# Development tools
set -gx COREPACK_ENABLE_AUTO_PIN false

# bat
set -gx BAT_THEME "Catppuccin Mocha Smoked"

# LS_COLORS — GNU ls
set -gx LS_COLORS "\
di=38;5;109:\
ln=38;5;67:\
ex=38;5;108:\
fi=38;5;250:\
or=38;5;131:\
mi=38;5;131:\
bd=38;5;67:\
cd=38;5;67:\
no=38;5;245:\
su=38;5;245:\
sg=38;5;245:\
*.tar=38;5;179:\
*.zip=38;5;179:\
*.gz=38;5;179:\
*.bz2=38;5;179:\
*.xz=38;5;179:\
*.log=38;5;242:\
*.tmp=38;5;242:\
*.bak=38;5;242"

# eza colors
set -gx EXA_COLORS "\
\
di=38;2;111;159;163:\
fi=38;2;184;192;204:\
ex=38;2;127;159;143:\
ln=38;2;91;111;138:\
so=38;2;91;111;138:\
pi=38;2;91;111;138:\
bd=38;2;91;111;138:\
cd=38;2;91;111;138:\
or=38;2;143;95;99:\
mi=38;2;143;95;99:\
\
\
ur=38;2;106;112;122:\
uw=38;2;106;112;122:\
ux=38;2;127;159;143:\
gr=38;2;106;112;122:\
gw=38;2;106;112;122:\
gx=38;2;127;159;143:\
tr=38;2;106;112;122:\
tw=38;2;106;112;122:\
tx=38;2;127;159;143:\
\
\
uu=38;2;138;148;166:\
gu=38;2;138;148;166:\
\
\
su=38;2;118;124;136:\
\
\
da=38;2;95;102;112:\
\
\
git=38;2;185;162;109:\
git-new=38;2;127;159;143:\
git-modified=38;2;143;95;99:\
git-deleted=38;2;143;95;99:\
git-renamed=38;2;127;159;143:\
git-ignored=38;2;76;86;106:\
\
\
*.tar=38;2;165;152;116:\
*.tgz=38;2;165;152;116:\
*.zip=38;2;165;152;116:\
*.gz=38;2;165;152;116:\
*.bz2=38;2;165;152;116:\
*.xz=38;2;165;152;116:\
\
\
*.log=38;2;76;86;106:\
*.tmp=38;2;76;86;106:\
*.bak=38;2;76;86;106"
