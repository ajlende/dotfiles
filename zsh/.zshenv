# Use volta for managing node versions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Use chruby for managing ruby versions on MacOS
if [[ `uname` == 'Darwin' ]]; then
    . /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    . /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi

# Hide the go directory as a dotfile directory
export GOPATH="$HOME/.go"

# The custom go path needs to be added manually
export PATH="$GOPATH/bin:$PATH"

# Required for running rootless docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Local scripts
export PATH="$HOME/.local/bin:$PATH"

