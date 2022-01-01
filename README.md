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

Now add the 2 commands from the installation output of brew to your path.
If everything is ok, you can start type brew.

Make brew-installs.sh executable by running `chmod 755 ./brew-installs.sh`

Now run ```./brew-installs.sh```

Then run brew-installs.sh
This will take time...

If you have problems install app store apps, you can install them manually.
For example: if the command was `mas install 994933038` navigate to:
https://apps.apple.com/us/app/id<THE_ID>
and install the app

Make brew-casks.sh executable by running `chmod 755 brew-cask.sh`
Now run ```./brew-cask.sh```



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
