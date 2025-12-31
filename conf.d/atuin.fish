status is-interactive || return

set -gx ATUIN_FILTER_MODE host
set -gx ATUIN_SEARCH_MODE fuzzy
set -gx ATUIN_HISTORY_FILTER_MODE session
