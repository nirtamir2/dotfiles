#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing applications via cask from cask.sh"
echo "#############################"
echo ""

# get current location
ROOT_DIR=$1

echo "installing VSCode"
brew uninstall --cask --force visual-studio-code && brew install --cask visual-studio-code
#brew uninstall --cask --force visual-studio-code-insiders && brew install --cask visual-studio-code-insiders

if [ -f ~/Library/Application\ Support/Code/User/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s "$ROOT_DIR/config/visual-studio-code-settings.json" ~/Library/Application\ Support/Code/User/settings.json

brew tap homebrew/cask-versions

echo "installing custom fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
# Fira code with fancy italics
open "$ROOT_DIR/static/fira-code-iscript/FiraCodeiScript-Regular.ttf"
open "$ROOT_DIR/static/fira-code-iscript/FiraCodeiScript-Bold.ttf"
open "$ROOT_DIR/static/fira-code-iscript/FiraCodeiScript-Italic.ttf"

brew install --cask font-oswald
brew install --cask font-ubuntu
# terminal font
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask graphql-playground

brew tap jeroenknoops/tap
brew install gitin

brew install --cask qlmarkdown
brew install --cask google-chrome
#brew install --cask google-chrome-canary
brew install --cask firefox
#brew install --cask firefox-nightly
brew install --cask iterm2
# install iterm utilities right away
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

# brew install --cask sigmaos
brew install --cask zoom
brew install --cask ngrok
#brew install --cask rocket # I use native macos emojis
brew install --cask monitorcontrol
brew install --cask raycast
brew install --cask fig
brew install gh
brew install --cask stretchly
brew install --cask webstorm
brew install --cask shottr
brew install --cask rectangle
#brew install --cask clipy # I use Raycast's clipboard
brew install --cask postman
#brew install --cask kap # I use zappy instead
brew install --cask xbar
brew install --cask obs
brew install --cask blender
brew install --cask authy
brew install --cask keycastr
brew install --cask cron
brew install --cask vlc
brew install --cask zappy


# Convert svg to favicons as seen https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs
brew install --cask inkscape

# Install Warp from https://www.warp.dev/

# Download linked - daily journal
#https://github.com/lostdesign/linked