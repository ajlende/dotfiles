# Use volta for managing node versions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Use chruby for managing ruby versions on MacOS
if [[ `uname` == 'Darwin' ]]; then
    . /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    . /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi

# Install node modules into the home directory to avoid sudo
# https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
export PATH="$HOME/.npm-global/bin:$PATH"

# Search globally installed modules during module resolution
export NODE_PATH="$HOME/.npm-global/lib/node_modules"

# Hide the go directory as a dotfile directory
export GOPATH="$HOME/.go"

# The custom go path needs to be added manually
export PATH="$GOPATH/bin:$PATH"

# Required for running rootless docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Local scripts
export PATH="$HOME/.local/bin:$PATH"

# Wayland experiments
#if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
#  MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
#fi
