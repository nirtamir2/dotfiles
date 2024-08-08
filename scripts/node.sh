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
brew install oven-sh/bun/bun
fnm install --lts
fnm use lts

printf "updating npm\n"
npm i -g npm


printf "installing pnpm"
npm install -g pnpm

# https://pnpm.io/completion
printf "installing pnpm completions"
pnpm completion zsh > ~/completion-for-pnpm.zsh
echo 'source ~/completion-for-pnpm.zsh' >> ~/.zshrc

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

# An interactive way to peruse your git history from the terminal https://github.com/Fakerr/git-recall
pnpm i -g git-recall

# Git multiple user config manager https://github.com/gauseen/gum Like nvm for git user
pnpm i -g gauseen/gum

# Terminal IDE style command line auto complete. https://github.com/microsoft/inshellisense
pnpm i -g @microsoft/inshellisense

# CLI building full-stack Next.js apps faster https://github.com/nicoalbanese/kirimase/
pnpm i -g kirimase

# Ask LLM directly from your terminal https://github.com/egoist/shell-ask
# git diff | ask cm
pnpm i -g shell-ask

# Installing terminal auto-completion to pnpm
pnpm install-completion

# pnpm ls -g --depth=0
# # pnpm i -g syncpack
# # pnpm i -g @slidev/cli
# # pnpm i -g license-checker
# # pnpm i -g license-report