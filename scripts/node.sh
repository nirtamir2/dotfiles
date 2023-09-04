#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Running global npm setup from npm.sh"
echo "#############################"
echo ""

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

# *************************************
# node
#
printf "installed fnm"
brew install fnm
fnm install --lts
fnm use lts

printf "updating npm\n"
npm i -g npm


printf "installing pnpm"
npm install -g pnpm

printf "installing switch-branch-cli"
npm install -g switch-branch-cli

printf "installing jiragit"
npm install -g @nirtamir2/jiragit

printf "installing svg-term-cli - Share terminal sessions as razor-sharp animated SVG everywhere"
npm install -g svg-term-cli

printf "installing npkill to remove node_modules"
npm i -g npkill

printf "installing kill-port to kill open port"
npm i -g kill-port

printf "Installing git change date"
npm i -g git-change-date

# https://github.com/danvk/source-map-explorer
printf "Installing source-map-explorer"
npm i -g source-map-explorer

# https://github.com/antfu/ni - Use the right package manager
npm i -g @antfu/ni

# https://github.com/wclr/yalc better npm link - publish packages locally
npm i -g yalc

# Download templates and git repositories https://github.com/unjs/giget
npm i -g giget