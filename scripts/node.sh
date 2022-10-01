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

echo "installing node and yarn via volta"
curl https://get.volta.sh | bash | volta install node yarn
printf "installed volta\n"
#
## loading nvm for now
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#
#if [ -L "$NVM_DIR/default-packages" ]; then
#  echo "found nvm default-packages - removing..."
#  rm "$NVM_DIR/default-packages"
#fi
#
#echo "linking $NVM_DIR/default-packages"
#ln -s "$CONFIG_DIR/package-lists/nvm-default-packages.txt" "$NVM_DIR/default-packages"
#
#nvm install stable
#nvm alias default stable
#nvm use stable
#
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
