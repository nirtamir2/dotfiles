#!/usr/bin/env sh

# get current location
ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"
SCRIPTS_DIR="$ROOT_DIR/scripts"

source "$ROOT_DIR/commands/__util.sh"

echo "Running commands/install.sh..."

# **********************************
# link private keys
#
FROM_FILES="$ROOT_DIR/.my-config.sh"
TARGET_DIR=~
symlink_files "$FROM_FILES" "$TARGET_DIR"

# **********************************
# root config files (.gitconfig, .npmrc, ...)
#

FROM_FILES="$CONFIG_DIR/home/.*"
TARGET_DIR=~
log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"

symlink_files "$FROM_FILES" "$TARGET_DIR"

# **********************************
# iTerm stuff
#

log_section_start "Installing iTerm2 shell integration for fancy menubar"
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# *************************************
# executables
#

FROM_DIR="$CONFIG_DIR/.bin"
TARGET_DIR=~/.bin
log_section_start "Sym linking $FROM_DIR to $TARGET_DIR"

rm "$TARGET_DIR"
symlink "$FROM_DIR" "$TARGET_DIR"

#