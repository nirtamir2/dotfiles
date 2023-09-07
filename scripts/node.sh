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

# https://pnpm.io/completion
printf "installing pnpm completions"
pnpm install-completion zsh

printf "installing switch-branch-cli"
pnpm install -g switch-branch-cli

printf "installing jiragit"
pnpm install -g @nirtamir2/jiragit

printf "installing svg-term-cli - Share terminal sessions as razor-sharp animated SVG everywhere"
pnpm install -g svg-term-cli

printf "installing npkill to remove node_modules"
pnpm i -g npkill

printf "installing kill-port to kill open port"
pnpm i -g kill-port

printf "Installing git change date"
pnpm i -g git-change-date

# https://github.com/danvk/source-map-explorer
printf "Installing source-map-explorer"
pnpm i -g source-map-explorer

# https://github.com/antfu/ni - Use the right package manager
pnpm i -g @antfu/ni

# https://github.com/wclr/yalc better npm link - publish packages locally
pnpm i -g yalc

# Download templates and git repositories https://github.com/unjs/giget
pnpm i -g giget