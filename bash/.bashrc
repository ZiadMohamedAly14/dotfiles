# ---------------------------------------------------------------------------
# Omarchy bootstrap — do not remove or reorder these three blocks.
# ---------------------------------------------------------------------------

# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions.
# Don't edit those directly — override them below instead.
source "$OMARCHY_PATH/default/bash/rc"

# ---------------------------------------------------------------------------
# Everything below is mine.
# See what Omarchy already defines before adding:
#   ls $OMARCHY_PATH/default/bash/
#   alias | less
# ---------------------------------------------------------------------------

# --- environment -----------------------------------------------------------
# export EDITOR="code --wait"
# export PGHOST="/var/run/postgresql"

# --- aliases ---------------------------------------------------------------
# alias g='git'
# alias ll='eza -la'

# --- functions -------------------------------------------------------------
# mkcd() { mkdir -p "$1" && cd "$1"; }

# --- path ------------------------------------------------------------------
# export PATH="$HOME/.local/bin:$PATH"
