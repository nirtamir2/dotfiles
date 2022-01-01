#!/usr/bin/env sh

echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

brew install zsh
brew install zsh-completions

# set it as default shell
chsh -s /bin/zsh

brew install highlight
brew install jq
brew install autojump
brew install gh
brew install curl
brew install git
brew install git-delta
brew install go
brew install shellcheck
brew install fzf
brew install coreutils
brew install nektos/tap/act
brew install docker
brew install docker-machine
brew install git-lfs
brew install bluesnooze

# taps
brew tap cantino/mcfly
brew install mcfly

# rust based tools
brew install bat
brew install exa
brew install grex

# ffmpeg for quick video compression
brew install ffmpeg --with-vorbis --with-libvorbis --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# *********************************
# mac app store
brew install mas
# magnet window management
#mas install 441258766
# todoist
#mas install 585829637
# NextDNS
#mas install 1464122853
# Clocker
mas install id1056643111
# Meeting Bar
mas install 1532419400
# Hand mirror
mas install 1502839586
# Annotate screenshots
mas install 994933038
# Monosnap screenshots
mas install 540348655
# Amphetamine - Powerful keep-awake utility
mas install 937984704
