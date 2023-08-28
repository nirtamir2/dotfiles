#!/usr/bin/env sh

echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

ROOT_DIR=$1
source "$ROOT_DIR/commands/__util.sh"

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew_install_or_upgrade zsh
brew_install_or_upgrade zsh-completions

# set it as default shell
chsh -s /bin/zsh

# Convert svg to favicons as seen https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs
brew_install_or_upgrade install imagemagick
brew_install_or_upgrade highlight
brew_install_or_upgrade jq
brew_install_or_upgrade autojump
brew_install_or_upgrade zoxide
brew_install_or_upgrade gh
brew_install_or_upgrade curl
brew_install_or_upgrade git
brew_install_or_upgrade git-delta
brew_install_or_upgrade go
brew_install_or_upgrade shellcheck
brew_install_or_upgrade fzf
brew_install_or_upgrade fx
brew_install_or_upgrade coreutils
brew_install_or_upgrade install act # run github actions locally
brew_install_or_upgrade docker
brew_install_or_upgrade docker-machine
brew_install_or_upgrade git-lfs
brew_install_or_upgrade bluesnooze
brew_install_or_upgrade asciinema # Record and share your terminal sessions, the simple way.
brew_install_or_upgrade wifi-password
brew_install_or_upgrade battery  # Keep battery max charging to 80% for longevity
# zsh-abbr when you have abbriviation like g="git", so when you write g+"space" it will replace it to git text
brew_install_or_upgrade install olets/tap/zsh-abbr

brew install watchman  # required for expo-cli installation see https://docs.expo.dev/get-started/installation/

# taps
brew tap cantino/mcfly
brew install mcfly

brew tap mcasper/formulae
brew install git-clean

# rust based tools
brew_install_or_upgrade bat
brew_install_or_upgrade exa
brew_install_or_upgrade grex
brew_install_or_upgrade starship

# PlanetScale DB CLI
brew_install_or_upgrade planetscale/tap/pscale

# ffmpeg for quick video compression
brew install ffmpeg --with-vorbis --with-libvorbis --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# *********************************
# mac app store
brew_install_or_upgrade mas

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
mas install 1502839586

# Annotate screenshots # I use zappy instead
#mas install 994933038

# Monosnap screenshots # I use zappy instead
#mas install 540348655

# Amphetamine - Powerful keep-awake utility
mas install 937984704

# Keynote presentation
mas install 409183694

# Install Warp from https://www.warp.dev/

# ********************************
# paid apps
# https://apps.apple.com/us/app/rcmd-app-switcher/id1596283165
