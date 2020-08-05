# Required for the tj/n node version manager which installs node, npx, and npm there
export PATH="/usr/local/bin:$PATH"

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

