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
brew install --cask postman # https://recipeui.com/ is better and also https://hoppscotch.io/ is good tood
#brew install --cask kap # I use zappy instead
brew install --cask xbar
brew install --cask obs
brew install --cask obs-advanced-scene-switcher
#brew install --cask virtualbox - not working in mac m1 so act (for running local github actions) won't work too
brew install --cask blender
brew install --cask authy
brew install --cask keycastr
brew install --cask cron
brew install --cask vlc
brew install --cask zappy
brew install --cask android-file-transfer
brew install --cask jetbrains-toolbox
brew install --cask android-studio
brew install --cask http-toolkit
brew install --cask vivaldi
brew install --cask obsidian
brew install --cask openinterminal
brew install --cask bitwarden

# choosy needs this rosetta thing for some reasons
sudo softwareupdate --install-rosetta
# brew install --cask choosy - # not free anymore
brew install --cask arc
brew install --cask cursor
# Convert svg to favicon as seen at https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs
brew install --cask inkscape
#brew install --cask kdenlive # video editor

# Install Warp from https://www.warp.dev/

# Download linked - daily journal
#https://github.com/lostdesign/linked