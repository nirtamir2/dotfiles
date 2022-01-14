#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
export VOLTA_HOME=$HOME/.volta

export PATH=:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.bin:$HOME/.go-modules/bin:/usr/local/opt/curl/bin:$HOME/.iterm2:$VOLTA_HOME/bin:$PATH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export GOPATH=$HOME/.go-modules
export EDITOR=code
export LC_ALL=en_US.UTF-8
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='❗  Use the alias: '

################################################################################
# private
source ~/.my-config.sh

################################################################################
# zsh
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT
# make command prefixed with space not appear in history
setopt histignorespace
# remove dups from history
setopt hist_ignore_all_dups


################################################################################
# things for the `lc` command
LC_DELIMITER_START="⋮";
LC_DELIMITER_END="⭐";

# write current command location to `.zsh_history_ext` whenever a command is ran
# `.zsh_history_ext` is used in `lc` command
function zshaddhistory() {
  # ignore empty commands
  if [[ $1 == $'\n' ]]; then return; fi

  # ignore specific commands
  local COMMANDS_TO_IGNORE=( ls ll cd j git gss gap lc ggpush ggpull);
  for i in "${COMMANDS_TO_IGNORE[@]}"
  do
    # return if the run commands starts with the ignored commands
    if [[ $1 == "$i"* ]]; then
      return;
    fi
  done

  echo "${1%%$'\n'}${LC_DELIMITER_START}${PWD}${LC_DELIMITER_END}" >> ~/.lc_history
}

# `lc` – last command
function lc() {
  SELECTED_COMMAND=$(grep -a --color=never "${PWD}${LC_DELIMITER_END}" ~/.lc_history | cut -f1 -d "${LC_DELIMITER_START}" | tail -r | fzf);

  # handle case of selecting no command via fzf
  if [[ ${#SELECTED_COMMAND} -gt 0 ]]; then
    echo "Running '$SELECTED_COMMAND'..."
    echo "**************************"
    eval " $SELECTED_COMMAND";
  fi
}

################################################################################
# oh-my-zsh

plugins=(git zsh-yarn-completions zsh-autosuggestions alias-tips fast-syntax-highlighting last-working-dir)
ZSH_THEME=""

# Customize history
HIST_STAMPS="dd-mm-yyyy"

source $ZSH/oh-my-zsh.sh

################################################################################
# iterm

# https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# set variables for iterm status bar
iterm2_print_user_vars() {
  it2git
  iterm2_set_user_var nodeVersion $(node -v)
  iterm2_set_user_var pwd $(pwd)
}

# mcfly
eval "$(mcfly init zsh)"

eval "$(starship init zsh)"

# make global modules requireable
export NODE_PATH="$(npm root -g)"

################################################################################
# npm

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
#
# if type complete &>/dev/null; then
#   _npm_completion () {
#     local words cword
#     if type _get_comp_words_by_ref &>/dev/null; then
#       _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
#     else
#       cword="$COMP_CWORD"
#       words=("${COMP_WORDS[@]}")
#     fi
#
#     local si="$IFS"
#     if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
#                            COMP_LINE="$COMP_LINE" \
#                            COMP_POINT="$COMP_POINT" \
#                            npm completion -- "${words[@]}" \
#                            2>/dev/null)); then
#       local ret=$?
#       IFS="$si"
#       return $ret
#     fi
#     IFS="$si"
#     if type __ltrim_colon_completions &>/dev/null; then
#       __ltrim_colon_completions "${words[cword]}"
#     fi
#   }
#   complete -o default -F _npm_completion npm
# elif type compdef &>/dev/null; then
#   _npm_completion() {
#     local si=$IFS
#     compadd -- $(COMP_CWORD=$((CURRENT-1)) \
#                  COMP_LINE=$BUFFER \
#                  COMP_POINT=0 \
#                  npm completion -- "${words[@]}" \
#                  2>/dev/null)
#     IFS=$si
#   }
#   compdef _npm_completion npm
# elif type compctl &>/dev/null; then
#   _npm_completion () {
#     local cword line point words si
#     read -Ac words
#     read -cn cword
#     let cword-=1
#     read -l line
#     read -ln point
#     si="$IFS"
#     if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
#                        COMP_LINE="$line" \
#                        COMP_POINT="$point" \
#                        npm completion -- "${words[@]}" \
#                        2>/dev/null)); then
#
#       local ret=$?
#       IFS="$si"
#       return $ret
#     fi
#     IFS="$si"
#   }
#   compctl -K _npm_completion npm
# fi
# ###-end-npm-completion-###

################################################################################
# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####