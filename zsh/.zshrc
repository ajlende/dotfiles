# +------------------------------------------------------------------------------------------------+
# |                                                                                                |
# |                                     ZSH Configuration Files                                    |
# |                                                                                                |
# +----------------+-----------+-----------+-------------------------------------------------------+
# |                |Interactive|Interactive|Script|                   Description                  |
# |                |login      |non-login  |      |                                                |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |/etc/zshenv     |    A      |    A      |  A   | Exported environment variables needed by all   |
# +----------------+-----------+-----------+------+ programs (ex. $PATH, $EDITOR, $PAGER).         |
# |~/.zshenv       |    B      |    B      |  B   |                                                |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |/etc/zprofile   |    C      |           |      | Alternative to zlogin for an experience like   |
# +----------------+-----------+-----------+------+ ksh. This should not be used in place of       |
# |~/.zprofile     |    D      |           |      | .profile; that should be done in .zshrc.       |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |/etc/zshrc      |    E      |    C      |      | Set up aliases, functions, history options,    |
# +----------------+-----------+-----------+------+ other options (setopt, unsetopt), interactive- |
# |~/.zshrc        |    F      |    D      |      | specific environment variables ($LS_COLORS).   |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |/etc/zlogin     |    G      |           |      | Should NOT change shell environment at all!!!  |
# +----------------+-----------+-----------+------+ Set terminal type and start xsession or other  |
# |~/.zlogin       |    H      |           |      | external commands.                             |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |                |           |           |      |                                                |
# +----------------+-----------+-----------+------+------------------------------------------------+
# |~/.zlogout      |    I      |           |      | Clean up anything done by zlogin.              |
# +----------------+-----------+-----------+------+                                                |
# |/etc/zlogout    |    J      |           |      |                                                |
# +----------------+-----------+-----------+------+------------------------------------------------+

########################################
# Interactive Environment Variables    #
########################################

# Who would ever use anything else?
export VISUAL=vim
export EDITOR="$VISUAL"

# Color man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Just cat if it fits on one screen
export LESS="$LESS --quit-if-one-screen"

# Allow ANSI color escape seqences to be colors instead of text (not to be confused with --raw-control-chars)
export LESS="$LESS --RAW-CONTROL-CHARS"

# Always make ^C exit
export LESS="$LESS --quit-on-intr"

# Set tab width to 4
export LESS="$LESS --tabs=4"

# Save history to a file
export HISTFILE=$HOME/.zsh_history

# Max value for history file is 2^63-1 since unlimited isn't an option
export SAVEHIST=922337203685477508

# Use a smaller amount for the stuff stored in memory (2^15-1 since we're working in powers of 2)
export HISTSIZE=32767

########################################
# Terminal configuration and Prompt    #
########################################

# Save durations and timestamps
setopt EXTENDED_HISTORY

# Write history file as commands are run
setopt INC_APPEND_HISTORY

# Ignore dupes in line editor, doesn't apply to file
setopt HIST_FIND_NO_DUPS

# Instead of typing 'cd my_folder', just type 'my_folder'
setopt AUTO_CD

# Manually load plugins without needing a plugin manager
if [[ `uname` == 'Darwin' ]]; then
	. /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	. /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	. /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
else
	. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Override up and down arrow keys to substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Color of the autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

# Color of a matching string or not found string when searching history
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=0,bg=6,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=0,bg=1,bold"

# Enable fuzzy searching in 
export HISTORY_SUBSTRING_SEARCH_FUZZY=1

# Enable vi mode
bindkey -v

# Start completions
autoload -Uz compinit; compinit

# Start prompt
eval "$(starship init zsh)"

########################################
# Aliases & Funcitons                  #
########################################

# Provide a way to call the old ones in case
alias __cat="/usr/bin/cat"
alias __grep="/usr/bin/grep"
alias __htop="/usr/bin/htop"
alias __ls="/usr/bin/ls"

# Overcoming the muscle memory of old commands in favor of new ones is too hard
alias cat="bat"
alias grep="rg"
alias htop="btm"
alias ls="exa"
alias pacman="yay"
alias tree="exa --tree"

# Brought over from grml-zsh-config
alias ll="exa -lg --git"
alias la="exa -lga --git"

# Quickly go to the git root directory or home or to the root
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

# Search file contents in the current directory
skrg() {
	sk --ansi -i -c 'rg --color=always --line-number "{}"'
}

# Search DuckDuckGo and open the result in the command line
ddg() {
	local cmd='php -r "'"echo urlencode('$@');"'"'
	local terms=`eval $cmd`
	open "https://duckduckgo.com/?q=$terms"
}

# Shhhh!
quiet() {
	$* > /dev/null 2>&1
}

# Just restart the whole shell instead of sourcing files
reload() {
	exec "$SHELL" "$@"
}

# Add confirmations to commands I don't want to accidentally run
confirm() {
	local answer
	echo -ne "zsh: sure you want to run '${YELLOW}$*${NC}' [yN]? "
	read -q answer
		echo
	if [[ "${answer}" =~ ^[Yy]$ ]]; then
		command "${@}"
	else
		return 1
	fi
}

# 'Cause sometimes you miss the 'g' when typing 'ddg'
dd() { confirm $0 $@; }

