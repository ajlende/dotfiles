# Dotbot `pikaur` Plugin

Plugin for [`dotbot`](https://github.com/anishathalye/dotbot) that adds a `pikaur` directive. It allows installation of packeges using [`pikaur`](https://github.com/actionless/pikaur), and by extension [`pacman`](https://www.archlinux.org/pacman), packages.

This plugin will attempt to install `pikaur` automatically. This should make it easier to set up a new computer.

## Installation

Add it as a submodule of your dotfiles repository.

```bash
git submodule add https://github.com/ajlende/dotbot-pikaur
git submodule update --init --recursive # clone pikaur
```

## Usage

One option is having your packages list in a separate file. This way you can run it separately from your main configuration.

```bash
./install -p dotbot-pikaur/pikaur.py -c packages.conf.yaml
```

Alternatively, you can add the directive directly in `install.conf.yaml` and modify your `install` script so it automatically enables the `pikaur` plugin.

```bash
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" \
  --plugin-dir "${BASEDIR}/dotbot-pikaur" "${@}"
```

## Configuration

Example of the `packages.conf.yaml`:

```yaml
- pikaur:
  - emacs
  - firefox
  - gitkraken
  - visual-studio-code-bin
  - zsh
```

Additionally, if you want to separate your `pacman` packages from your AUR packages, you can put them in a directive named `pacman`. Both directives are functionally the same, but may allow you to organize things a little more.

```yaml
- pacman:
  - emacs
  - firefox
  - zsh
- pikaur:
  - gitkraken
  - visual-studio-code-bin
```

## Usage with [`dotbot-brew`](https://github.com/d12frosted/dotbot-brew)

`dotbot-pikaur` and `dotbot-brew` both use a `for-in` loop iterate over the the values of a list which also just so happens to work on the keys of a dict. (I can't promise that this won't change for `dotbot-brew`, but at the time of this writing, it works.)

```yaml
- &common
  ? package1
  ? package2

- pikaur:
  <<: *common
  ? linux-specific1

- brew:
  <<: *common
  ? mac-specific1
```

This takes advantage of the [merge key (<<) in YAML](http://yaml.org/type/merge.html) which joins maps since there isn't an equivalent for lists.

The downside with this is that you'll be getting an error when you run it.
```
Action package1 not handled
Action package2 not handled
```
This is a side-effect of [how the YAML files are parsed](http://stackoverflow.com/a/37416152). The `&common` anchor will be treated as a list of directives that Dotbot will try to run.

To get around the problem you could call the common one `brew` or `pikaur` and remove the merge key like below which doesn't look great, but will fix the error.

```yaml
- pikaur: &common
  ? package1
  ? package2

- pikaur:
  ? linux-specific1

- brew:
  <<: *common
  ? mac-specific1
```
