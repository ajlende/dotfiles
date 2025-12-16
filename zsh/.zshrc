########################################
# Aliases & Funcitons                  #
########################################

# Overcoming the muscle memory of old commands in favor of new ones is too hard
alias cat="bat"
alias grep="rg"
alias ls="eza"
alias top="btm"
alias tree="eza --tree"
alias cloc="scc"
alias pip="uv pip"
alias python="uv run"
alias vim="nvim"

# Brought over from grml-zsh-config
alias ll="eza -lg --git"
alias la="eza -lga --git"

# Quickly go to the git root directory
...() {
	local repo="$(git rev-parse --show-toplevel 2>/dev/null)"
	if [[ -n "$repo" ]]; then
		cd "$repo"
	elif [[ $PWD == "$HOME"* ]]; then
		cd
	else
		cd /
	fi
}

# Find the process using a port
portf() {
    lsof -i :$1
}

# Shhhh!
quiet() {
	$* > /dev/null 2>&1
}

# Just restart the whole shell instead of sourcing files
reload() {
	exec "$SHELL" "$@"
}

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

########################################
# Colors                               *
########################################

# Configure color variables
autoload -U colors && colors

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxexdxcxegedabagacad

# grep colors
export GREP_OPTIONS='--color=auto'

# bat colors
export BAT_THEME="Monokai Pro"

# Color man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

########################################
# Prompt                               #
########################################

source $HOME/.zsh_prompt

########################################
# History                              #
########################################

# Save history to a file
export HISTFILE=$HOME/.zsh_history

# Max value for history file is 2^63-1 since unlimited isn't an option
export SAVEHIST=922337203685477508

# Use a smaller amount for the stuff stored in memory (2^15-1 since we're working in powers of 2)
export HISTSIZE=32767

# Save durations and timestamps
setopt EXTENDED_HISTORY

# Write history file as commands are run
setopt INC_APPEND_HISTORY

# Ignore dupes in line editor, doesn't apply to file
setopt HIST_FIND_NO_DUPS

# Reduce whitespace in history
setopt HIST_REDUCE_BLANKS

# Reduce whitespace in history
setopt HIST_IGNORE_SPACE

########################################
# ZSH syntax highlighting              #
########################################

# Enable zsh-syntax-highlighting plugin
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Overrides for syntax higlighting
ZSH_HIGHLIGHT_STYLES[path]=
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix]=

########################################
# ZSH history substring search         #
########################################

# Enable zsh-history-substring-search plugin
# Must happen after zsh-syntax-hightlighting
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Enable fuzzy searching in 
export HISTORY_SUBSTRING_SEARCH_FUZZY=1

# Ensure substring search only shows unique entires
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Color of a matching string or not found string when searching history
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=0,bg=6,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=0,bg=1,bold"

########################################
# ZSH autosuggest                      #
########################################

# Enable zsh-autosuggestions
# Must happen after zsh-history-substring-search
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Color of the autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

########################################
# Miscelaneous options                 #
########################################

# Instead of typing 'cd my_folder', just type 'my_folder'
setopt AUTO_CD

# Allow interactive comments
setopt INTERACTIVE_COMMENTS

########################################
# Keybindings                          #
########################################

# Enable vi mode
bindkey -v

bindkey '^[[Z' reverse-menu-complete
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

########################################
# Completions                          #
########################################

# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST

# Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly.
setopt AUTO_MENU

# If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word. That is, the cursor is moved to the end of the word if either a single match is inserted or menu completion is performed.
setopt ALWAYS_TO_END

# TODO
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Add additional zsh-completions
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Initialize zsh completions
autoload -U compinit && compinit

# Add more features for completions
zmodload zsh/complist

##########################################
# TabTab completions                     #
##########################################

# tabtab source for packages
# if [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]]; then 
#   . ~/.config/tabtab/zsh/__tabtab.zsh
# fi

##########################################
# Interactive environment for JavaScript #
##########################################

# Fast node.js manager
# eval "$(fnm env --use-on-cd)"

# Bun completions
# . "$HOME/.bun/_bun"

# Deno env
# . "$HOME/.deno/env"

# Deno completions
# if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
#   export FPATH="$HOME/.zsh/completions:$FPATH"
# fi

##########################################
# Interactive environment for Rust & ESP #
##########################################

# . "$HOME/.cargo/env"
# . "$HOME/.esp/export-esp.sh"

##########################################
# Interactive environment for Ruby       #
##########################################

# Ruby Chruby
# . /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# . /opt/homebrew/opt/chruby/share/chruby/auto.sh

##########################################
# Interactive environment for Python     #
##########################################

# Add shell completions for uv
# eval "$(uv generate-shell-completion zsh)"
# eval "$(uvx --generate-shell-completion zsh)"

# Automatically activate venv via chpwd hook
# function _venv_autoload_hook() {
#   if [[ -d .venv ]]; then
#     if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
#       source .venv/bin/activate
#     fi
#   else
#     if [[ -n "$VIRTUAL_ENV" ]]; then
#       deactivate
#     fi
#   fi
# }
# add-zsh-hook chpwd _venv_autoload_hook && _venv_autoload_hook

####################################################################################################
# +----------------------------------------------------------------------------------------------+ #
# |                                                                                              | #
# |                                   ZSH Configuration Files                                    | #
# |                                                                                              | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# |               | New Term  | Nested    |        |                                             | #
# | Config file   | TTY/SSH   | shell     | Script | Description                                 | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# | /etc/zshenv   |     1     |     1     |   1    | Essential environment variables needed by   | #
# +---------------+-----------+-----------+--------| any process. Must not produce any output.   | #
# | ~/.zshenv     |     2     |     2     |   2    | Ex: $PATH, $EDITOR, umask                   | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# | /etc/zprofile |     3     |           |        | Commands run once for a new session. Sets   | #
# +---------------+-----------+-----------+--------| session-specific variables, startup tasks.  | #
# | ~/.zprofile   |     4     |           |        | Ex: ssh-add, brew shellenv, fortune         | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# | /etc/zshrc    |     5     |     3     |        | Shell behavior customization: options,      | #
# +---------------+-----------+-----------+--------| aliases, functions, prompt, completions.    | #
# | ~/.zshrc      |     6     |     4     |        | Ex: setopt, alias ll='ls -l', compinit      | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# | /etc/zlogin   |     7     |           |        | Commands run late in new session startup.   | #
# +---------------+-----------+-----------+--------| Prefer using .zprofile instead.             | #
# | ~/.zlogin     |     8     |           |        | Ex: echo "Welcome", startx (historical)     | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# |               |           |           |        |                                             | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
# | ~/.zlogout    |     9     |           |        | Commands run when a session ends.           | #
# +---------------+-----------+-----------+--------| Used for cleanup or final messages.         | #
# | /etc/zlogout  |    10     |           |        | Ex: clear, ehco "Goodbye"                   | #
# +---------------+-----------+-----------+--------+---------------------------------------------+ #
####################################################################################################

