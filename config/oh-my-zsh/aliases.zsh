# good-looking list handling
alias obsidian="/Applications/Obsidian.app/Contents/MacOS/Obsidian"

alias ll='exa -la --git --icons'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# colored cat command
alias cat='bat'

# ip address
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;"


# set up https-server
# https://paulbrowne.xyz/https-localhost
alias https-server='http-server --ssl --cert ~/.ssl/localhost.crt --key ~/.ssl/localhost.key -a localhost -o'

# launch applications
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'
alias chromeDebug='chrome --remote-debugging-port=9222'

# npm stuff
# alias ni='npm install'
# alias nis='npm install --save'
# alias nid='npm install --save-dev'
# alias nig='npm install --global'
# alias ns='npm start'
# alias nt='npm test'
# alias nit='npm install && npm test'
# alias nk='npm link'
# alias nr='npm run'
# alias npm-reset='rm -rf node_modules && rm -f package-lock.json && npm install && npx node-notifier-cli -t "Done" -m "npm modules reinstalled" -s Glass -i https://cdn.rawgit.com/npm/logos/31945b5c/npm%20square/n-64.png'
# alias dnm='rm -rf node_modules && npm i'

alias gcop='git co -p'
alias gap='git add -p'
alias gcop!='git co -p --amend'
alias gz='git zup'

alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -v"

# trash
alias t=trash

# MAC adress changer (free wifi hack)
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

# directory short cuts
alias p='cd ~/Projects/'
alias d='cd ~/Downloads/'
#alias sj='cd ~/Projects/github.com/stefanjudis/stefan-judis-website/'

alias gbb="git_backup_current_branch"
# Creates a commit with no-verify and revert it
alias gcr="git_commit_reset"
# log all branches by commit date in desc order
alias gb="git branch -v --sort=-committerdate"
