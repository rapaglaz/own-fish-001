status is-interactive || return

# GPG - only needed for interactive sessions
set -gx GPG_TTY (tty)
