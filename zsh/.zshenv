########################################
# Local scripts                        #
########################################
 
# Local scripts
export PATH="$HOME/.local/bin:$PATH"

########################################
# External programs                    #
########################################

# Docker
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

########################################
# Interactive environment variables    #
########################################

# Who would ever use anything else?
export VISUAL=nvim
export EDITOR="$VISUAL"

# Just cat if it fits on one screen (no init needed for git)
export LESS="$LESS --quit-if-one-screen --no-init"

# Allow ANSI color escape seqences to be colors instead of text (not to be confused with --raw-control-chars)
export LESS="$LESS --RAW-CONTROL-CHARS"

# Always make ^C exit
export LESS="$LESS --quit-on-intr"

# Set tab width to 4
export LESS="$LESS --tabs=4"

