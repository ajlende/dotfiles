########################################
# Aliases & Funcitons                  #
########################################

# Overcoming the muscle memory of old commands in favor of new ones is too hard
alias cat="bat"
alias grep="rg"
alias ls="eza"
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
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=black,bold
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


########################################
# Interactive environment for bun      #
########################################

# Add bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

########################################
# Interactive environment for node.js  #
########################################

eval "$(fnm env --use-on-cd)"

########################################
# Interactive environment for python   #
########################################

# Add shell completions for uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Automatically activate venv via chpwd hook
function _venv_autoload_hook() {
  if [[ -d .venv ]]; then
    if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
      source .venv/bin/activate
    fi
  else
    if [[ -n "$VIRTUAL_ENV" ]]; then
      deactivate
    fi
  fi
}
add-zsh-hook chpwd _venv_autoload_hook && _venv_autoload_hook

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

