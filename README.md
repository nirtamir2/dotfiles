# Stefan's dotfiles

Type
```
git
```
Then install "Command Dine Developer Tools" in the window it shows you.

```
git clone https://github.com/nirtamir2/dotfiles.git
```

After that - install homebrew.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

make dotfiles.sh executable by running `chmod 755 dotfiles.sh`

Now run dotfiles install

## How to get started

```
# install stuff and link config files
~/path/to/dotfiles/dotfiles install

# back up config files
~/path/to/dotfiles/dotfiles backup
```

## What's included

- Alfred preferences
- brew dependencies
- iTerm2 config
- npm config and dependencies
- shell functions
- VSCode config and plugins
- zsh config and aliases

## Notes

### Alfred workflows

Alfred workflows are included in `.gitignore`. These will be installed in `node.sh` via npm packages.
