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

# alternative xnip: # https://apps.apple.com/il/app/xnip-screenshot-annotation/id1221250572?mt=12 # mas install 1221250572
brew install --cask shottr

# brew install --cask rectangle # I use Raycast Window Manager

# # Window management https://github.com/MrKai77/Loophttps://github.com/MrKai77/Loop window manager with cool UI
# brew install mrkai77/cask/loop # I use Raycast's Window Manager

#brew install --cask rectangle # I use Raycast Window Manager
#brew install --cask clipy # I use Raycast's clipboard
brew install --cask postman # In the future try https://insomnia.rest/, https://www.usebruno.com/, https://httpie.io/, https://hoppscotch.io/
#brew install --cask kap # I use zappy instead
brew install --cask xbar
brew install --cask obs
brew install --cask blender
brew install --cask authy
brew install --cask keycastr
brew install --cask notion-calendar
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
brew install --cask openinterminal
brew install pyenv

# qBittorrent BitTorrent client https://github.com/qbittorrent/qBittorrent
brew install --cask qbittorrent

brew install --cask tor-browser
# Run android & apple emulators from menu bar https://github.com/okwasniewski/MiniSim
brew install --cask minisim

brew install --cask warp # Warp Terminal https://www.warp.dev/

# Rewind is a personalized AI powered by everything you’ve seen, said, or heard https://www.rewind.ai/
brew install --cask rewind

# https://dataflare.app/ # DB shell GUI

brew install --cask pieces
# https://pieces.app/ # Pieces OS - save snippets with AI support and integrations to Browser, Obsidian, VSCode and JetBrains IDE

# Less used tools
# brew install --cask krisp # https://krisp.ai take notes and remove noise from meetings, but rewind does this better so no needed
# https://gpt4all.io/ # GPT4All - Run LLM Locally (Open source) - better to use Ollama
# https://toolcat.app/ # misc tools
# https://github.com/lostdesign/linked - Linked - daily journal
brew install --cask lm-studio # lm-studio is local gpt like olama and gpt4all https://lmstudio.ai/

# WhatsApp desktop
brew install --cask whatsapp

# Discord
brew install --cask discord

# Voice to text
# brew install --cask macwhisper

# https://clockify.me - Time Tracking for freelancing works
brew install --cask clockify

# https://frappebooks.com/ - Accounting for freelancers and small businesses
brew install --cask frappe-books

# Hyperkey Caps Lock - I moved to https://hyperkey.app/
# brew install --cask karabiner-elements

# Map right option to ctrl+cmd+shift+option ⭐ hyperkey
brew install --cask hyperkey

# Datagrip - DB IDE https://www.jetbrains.com/datagrip/
brew install --cask datagrip

# Bunch - Bunch lets you use plain text files to perform commands and launch batches of apps and scripts.
brew install --cask bunch

# capcut - Video editing and image design platform
brew install --cask capcut

# Texts.com - All instant messages apps
curl https://texts.com/i/ZzHu7YOjEwN3C3NxAg6lAiAcTFhakxxazth1eIxkOk/nir.sh | sh

# Zed.dev faster vscode alternative that works with Ollama natively
brew install --cask zed

# Google Chrome Canary version
brew install --cask google-chrome@canary

# AltTab - Windows alt-tab on macOS https://alt-tab-macos.netlify.app/
brew install --cask alt-tab

# Prevent apple music to open.
brew install --cask notunes

#iA Presenter https://ia.net/presenter

# local.ai - not needed
#docker run -p 8080:8080 --name local-ai -ti localai/localai:latest-aio-cpu
