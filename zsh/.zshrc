########################################
# Aliases & Funcitons                  #
########################################

alias open="xdg-open"
alias cat="bat"
alias ls="exa"
alias tree="exa --tree"
alias pacman="yay"
alias hbot="btm -b"

quiet() {
  $* > /dev/null 2>&1
}

########################################
# Interactive Environment Variables    #
########################################

export EDITOR=vim
export KEYTIMEOUT=1
export LESS="$LESS -FRXK --raw-control-chars"
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=922337203685477508
export HISTSIZE=32767

########################################
# Terminal configuration and Prompt    #
########################################

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS

eval "$(starship init zsh)"

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

