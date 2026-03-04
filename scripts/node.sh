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

# # https://github.com/jinghaihan/pncat
# printf "installing pncat - pnpm package catalog CLI"
# pnpm install -g pncat

# https://github.com/antfu/nip
printf "installing nip - A better 'pnpm install xxx' with prompts and catalogs support."
pnpm install -g @antfu/nip

printf "installing jiragit"
pnpm install -g @nirtamir2/jiragit

printf "installing svg-term-cli - Share terminal sessions as razor-sharp animated SVG everywhere"
pnpm install -g svg-term-cli

printf "installing npkill to remove node_modules"
pnpm i -g npkill

printf "installing kill-port to kill open port"
pnpm i -g kill-port

printf "installing degit for straightforward project scaffolding"
# degit user/repo/subdirectory
# https://github.com/Rich-Harris/degit
npm i -g degit

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

# CLI tool to interact with Ralph Wiggum AI assistant
pnpm install -g @th0rgal/ralph-wiggum

# GitHuman - Keep the Human in the Loop of coding
# https://github.com/mcollina/githuman
pnpm install -g githuman

# difit - A lightweight command-line tool that spins up a local web server to display Git commit diffs in a GitHub-like Files changed view 
# https://github.com/yoshiko-pg/difit
pnpm install -g difit


# https://termly.dev/ - Run OpenCode from your phone
pnpm install -g @termly-dev/cli

# https://www.vibekanban.com/
# Vibe Kanban lets you run coding agents in parallel without conflicts, and perform code review through our diff tool. Now you can focus on planning and quality instead of watching terminal logs.
pnpm install -g vibe-kanban

# Replace port numbers with stable, named .localhost URLs. For humans and agents. https://port1355.dev/
npm install -g portless


# Installing terminal auto-completion to pnpm
pnpm install-completion

# pnpm ls -g --depth=0
# # pnpm i -g syncpack
# # pnpm i -g @slidev/cli
# # pnpm i -g license-checker
# # pnpm i -g license-report