#!/usr/bin/env sh

echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

ROOT_DIR=$1
source "$ROOT_DIR/commands/__util.sh"

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install zsh
brew install zsh-completions

# set it as default shell
chsh -s /bin/zsh

# Convert svg to favicons as seen https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs
brew install imagemagick
brew install highlight
brew install jq
brew install autojump
brew install gh
gh extension install dlvhdr/gh-dash
brew install curl
brew install git
brew install git-delta
brew install go
brew install shellcheck
brew install fzf
brew install fx
brew install coreutils
brew install nektos/tap/act
brew install docker
brew install docker-machine
brew install git-lfs
brew install bluesnooze
brew install asciinema # Record and share your terminal sessions, the simple way.
brew install wifi-password

# Better youtube-dl - download from youtube https://github.com/yt-dlp/yt-dlp
brew install yt-dlp

# For downloading youtube videos with Raycast extensions
brew install ffmeg

# httrack website copier https://www.httrack.com/
brew install httrack

brew install ollama # https://ollama.ai/  Ollama - Run LLM Locally (Open source) with plugin options like Raycast.

brew install watchman  # required for expo-cli installation see https://docs.expo.dev/get-started/installation/

# taps
brew tap cantino/mcfly
brew install mcfly

brew tap mcasper/formulae
brew install git-clean

brew install oven-sh/bun/bun

# AeroSpace is an i3-like tiling window manager for macOS https://github.com/nikitabobko/AeroSpace
#brew install --cask nikitabobko/tap/aerospace


# rust based tools
brew install bat
brew install eza
brew install grex
brew install starship
brew install peterldowns/tap/localias

# PlanetScale DB CLI
# brew install planetscale/tap/pscale

# ffmpeg for quick video compression
brew install ffmpeg --with-vorbis --with-libvorbis --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# *********************************
# mac app store
brew install mas

brew install neovim

# Prerequisites for nvchad
brew install ripgrep

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim


# magnet window management
# mas install 441258766

# todoist
#mas install 585829637

# NextDNS
# mas install 1464122853

# Clocker # I use Cron instead
#mas install 1056643111

# Meeting Bar # I use Cron instead
# mas install 1532419400

# Hand mirror
#mas install 1502839586 - I use Raycast "open camera"

# Annotate screenshots # I use zappy instead
#mas install 994933038

# Monosnap screenshots # I use zappy instead
#mas install 540348655

# Amphetamine - Powerful keep-awake utility
mas install 937984704

# Command X - Cut and paste files in Finder https://sindresorhus.com/command-x
mas install 6448461551

# Amazing AI - Text-to-Image Stable Diffusion https://apps.apple.com/us/app/amazing-ai/id1660147028
#mas install 1660147028

# Lyne, Precision, Simplified - vertical & horizontal lines https://apps.apple.com/us/app/lyne-precision-simplified/id6478086157
mas install 6478086157

## Aiko - AI Speech-to-Text (Transcribe) https://apps.apple.com/us/app/aiko/id1672085276
#mas install 1672085276

# https://github.com/AugustDev/enchanted Ollama UI https://apps.apple.com/gb/app/enchanted-llm/id6474268307
mas install 6474268307

# Install Warp from https://www.warp.dev/

# Multi.app alternative - pop is better
#brew install --cask coscreen

# Multi.app alternative
brew install --cask pop

brew install --cask chatgpt

# ********************************
# paid apps
# https://apps.apple.com/us/app/rcmd-app-switcher/id1596283165

brew install mackup

# Python stuff
brew install pyenv
brew install poetry

# Screenpipe - like Rewind but open source https://github.com/louis030195/screen-pipe
brew tap louis030195/screen-pipe https://github.com/louis030195/screen-pipe.git
brew install screenpipe

# A virtual monitor for screen sharing
# Useful if you have wide screen and you want to share it with regular screens
# https://github.com/Stengo/DeskPad
# brew install deskpad

# lumen is a command-line tool that uses AI to generate commit messages,
# summarise git diffs or past commits. I configured it with Google
# https://github.com/jnsahaj/lumen 
brew install jnsahaj/lumen/lumen

# Terminal
brew install ghostty

# OpenCode - A powerful AI coding agent. Built for the terminal. https://opencode.ai https://github.com/sst/opencode
brew install sst/tap/opencode

# A tool for managing macOS defaults declaratively via YAML files. https://github.com/dsully/macos-defaults
brew install dsully/tap/macos-defaults

# GNU Stow is a symlink farm manager https://www.gnu.org/software/stow/
brew install stow

# https://github.com/sharkdp/fd - A simple, fast and user-friendly alternative to find
brew install fd

brew install opencode

# A lightweight window border system for macOS - https://github.com/FelixKratz/JankyBorders
brew tap FelixKratz/formulae
brew install borders
brew services start borders

# PostgreSQL client libraries, I use pg_dump command to backup prisma
brew install libpq

# Worktrunk is a CLI for Git worktree management, designed for parallel AI agent workflows
# worktrunk.dev
brew install worktrunk && wt config shell install

# Docker sandbox https://docs.docker.com/ai/sandboxes/
brew install docker/tap/sbx
sbx login


# Twitter local stuff
brew install steipete/tap/birdclaw
 
brew install --cask xdevplatform/tap/xurl
brew install steipete/tap/bird

