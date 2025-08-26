# find shorthand
function f() {
  find . -name "$1"
}

function cd(){
  [[ -t 1 && $((RANDOM%20)) -eq 0 ]] && echo " -> 🐶 \"woof\""; builtin cd "$@";
}

# quickly look up a folder
# grep-folder perf-*
function grep-folder() {
  ll | grep $1
}

function cdgr() {
  cd $(gitroot)
}

function rs() {
  if [ ! -f "package.json" ]; then
    echo "No package.json found in current directory"
    return 1
  fi
  
  jq -r '.scripts // {} | to_entries[] | "\u001b[37m\(.key)\u001b[0m\t\(.key)\t\(.value)"' package.json | \
  fzf --height=20% --reverse --info=inline --ansi \
      --with-nth=1 \
      --delimiter=$'\t' \
      --preview='echo {3}' \
      --preview-window=down:1:wrap | \
  cut -f2 | \
  xargs -r pnpm run
}

# Project scripts
function ps() {
  # Get git root or use current directory
  git_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
  
  # Color array for different prefixes
  colors=(31 32 33 34 35 36 91 92 93 94 95 96)  # red, green, yellow, blue, magenta, cyan, bright variants
  
  # Find all package.json files and extract scripts with their locations
  find "$git_root" -name "package.json" -not -path "*/node_modules/*" -type f 2>/dev/null | \
  while IFS= read -r pkg; do
    dir=$(dirname "$pkg")
    dir_name=$(basename "$dir")
    
    # Check if git root to show as "root" instead of directory name
    if [ "$dir" = "$git_root" ]; then
      prefix="root"
      color_code="35"  # magenta for root
    else
      prefix="$dir_name"
      # Generate consistent color for each prefix using hash
      hash=$(echo "$prefix" | cksum | cut -d' ' -f1)
      color_index=$((hash % ${#colors[@]}))
      color_code="${colors[$color_index]}"
    fi
    
    # Extract scripts and format them with colors
    jq -r --arg prefix "$prefix" --arg dir "$dir" --arg color "$color_code" '
      .scripts // {} | 
      to_entries[] | 
      "\u001b[\($color)m\($prefix)\u001b[0m:\u001b[37m\(.key)\u001b[0m\t\(.key)\t\(.value)\t\($dir)"
    ' "$pkg" 2>/dev/null
  done | \
  fzf --height=20% --reverse --info=inline --ansi \
      --with-nth=1 \
      --delimiter=$'\t' \
      --preview='echo {3}' \
      --preview-window=down:1:wrap | \
  {
    IFS=$'\t' read -r display script_name script_cmd script_dir
    if [ -n "$script_name" ] && [ -n "$script_dir" ]; then
      echo "Running '$script_name' in $script_dir"
      cd "$script_dir" && pnpm run "$script_name"
    fi
  }
}



function prepare_video() {
  if ! [ $# -eq 2 ]; then
    echo "Wrong parameter usage: \n $ prepare_video <inputFile> <outputFileBase>"
    return 1
  fi

  ffmpeg -i $1 -vcodec h264 -acodec mp2 $2.mp4
  ffmpeg -i $2.mp4 -strict -2 $2.webm
}

function gif_to_video() {
  if ! [ $# -eq 1 ]; then
    echo "Wrong parameter usage: \n $ compress_video <inputFile> <outputFileBase>"
    return 1
  fi

  ffmpeg -i $0 -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $2.mp4
  ffmpeg -i $2.mp4 -strict -2 $2.webm
}


#
# watchman test.txt 1 echo 'Tada!'
#
function watchman {
  initial_time=$(stat -f '%Z' $1)
  while true; do
    changed_time=$(stat -f '%Z' $1)
    if [ $initial_time != $changed_time ]; then
      eval ${@:3}
      initial_time=$changed_time
    fi
    sleep $2
  done
}

#
# Find a port blocker
#
function find_port_blocker() {
  if ! [ $# -eq 1 ]; then
    echo "Please define the port you want to check \n $ find_port_blocker 8000"
    return 1
  fi

  lsof -i tcp:$1
}

# Change MAC adress to get around public wifi limitations
function hack_the_space() {
  NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  echo $NEW_MAC_ADDRESS
  sudo ifconfig en0 ether "$NEW_MAC_ADDRESS"
  echo "New MAC Address set"
}

# Load .env file
function loadEnv() {
  set -o allexport; source $1; set +o allexport
  printf "Loaded vars in $1"
}

function diff() {
  if [ "$#" -ne 2 ]; then
    command diff "$@"
    return
  fi

  git diff --no-index $1 $2;
}

# trash-cli replacement
function trash() {
  echo "🗑️  Moving files to trash..."

  for var in "$@"
  do
    mv "$var" "$HOME/.trash"
  done
}

# overwrite mv command to also work with one argument
function mv() {
  if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
    command mv "$@"
    return
  fi

  newfilename="$1"
  vared newfilename
  command mv -v -- "$1" "$newfilename"
}

# create files in subfolders
function touchp() {
  mkdir -p "$(dirname "$1")/" && touch "$1"
}

# git handling
function clone() {
  git clone $1
  cd $(basename ${1%.*})

  if test -f "./package.json"; then
    echo "..."
    echo "Found package.json... installing dependencies"
    echo "..."
    npm install
  fi
}

function open-gql-playground() {
  local ENDPOINT=$1
  local AUTH_TOKEN=$2

  open "graphql-playground://endpoint=$ENDPOINT?headers={\"Authorization\": \"Bearer $AUTH_TOKEN\"}"
}

function npm-diff() {
  npm diff --diff=$1@$2 --diff=$1@$3 | delta --width $(tput cols) | less
}

function dev() {
  echo "Running 'npm run dev' in $1 ..."
  cd ~/Projects/"$1" || return
  code .
  npm run dev
}

function extract-text-from-image() {
  if [ $# -eq 0 ]; then
    echo "Please specify the file you want to scan.";
    echo "  -> extract-text-from-image /some/path/image.png";
    return 1;
  fi

  TARGET_DIR=$(dirname "$1");
  FILENAME=$(basename -- "$1");
  FILENAME_WITHOUT_EXTENSION="${FILENAME%.*}";

  tesseract "$1" "$TARGET_DIR/$FILENAME_WITHOUT_EXTENSION" -l eng txt || return 1;
  pbcopy < "$TARGET_DIR/$FILENAME_WITHOUT_EXTENSION.txt";
  rm "$TARGET_DIR/$FILENAME_WITHOUT_EXTENSION.txt";
  echo "🎉 Text copied to clipboard!";
}

# git stuff
# for gbb alias
function git_backup_current_branch() {
  git branch $(git_current_branch)--$(date +%d-%m-%y--%H-%M)
  print "$(git_current_branch)--$(date +%d-%m-%y--%H-%M)"
}

# for gcr alias
function git_commit_reset {
  # Store the commit message in a variable, or use "wip" as the default message
  commit_message=${1:-wip}

  # Do the initial commit with --no-verify flag and commit all files
  git commit --no-verify -am "$commit_message"

  # Revert the commit with default message and avoid opening COMMIT_EDITMSG window
  git revert --no-edit HEAD

  # Revert the commit again with default message and avoid opening COMMIT_EDITMSG window
  git revert --no-edit HEAD

  # Reset the commit to take the commit files to the file system
  git reset --mixed HEAD~1
}

# for wip alias
# Commit all changes with a WIP message, revert twice, and reset to keep changes in the working directory
function git_commit_wip {
  # Store the commit message in a variable, or use "wip" as the default message
  commit_message=${1:-wip}

  # Do the initial commit with --no-verify flag and commit all files
  git commit --no-verify -am "$commit_message"
}

# Commit all changes with a WIP message, revert twice, and reset to keep changes in the working directory
function git_commit_reset_lumen {
  # Add all changes
  git add --all

  # Execute 'lumen draft' and store the output in a variable
  commit_message=$(lumen draft)

  # Commit with the message, using --no-verify to skip hooks
  git commit --no-verify -m "WIP - $commit_message"

  # Revert the last commit without opening an editor
  git revert --no-edit HEAD

  # Revert again without opening an editor
  git revert --no-edit HEAD

  # Reset to keep changes in the working directory
  git reset --mixed HEAD~1
}

# For wip alias
# Quickly commit all changes with a WIP message generated by 'lumen draft', skipping hooks
function git_commit_wip_lumen {
  # Add all changes
  git add --all

  # Execute 'lumen draft' and store the output in a variable
  commit_message=$(lumen draft)

  # Commit with the message, using --no-verify to skip hooks
  git commit --no-verify -m "WIP - $commit_message"
}

# Navigate to the root of the git repository
function gitroot() {
  cd $(git rev-parse --show-toplevel)
}

# for gpn alias
# https://gist.github.com/douglas/1287372
function git_pull_nested {
  # store the current dir
  CUR_DIR=$(pwd)

  # Let the person running the script know what's going on.
  echo "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

  # Find all git repositories and update it to the master latest revision
  for i in $(find . -name ".git" | cut -c 3-); do
      echo "";
      echo "\033[33m"+$i+"\033[0m";

      # We have to go to the .git parent directory to call the pull command
      cd "$i";
      cd ..;

      # finally pull
      git pull origin main;

      # lets get back to the CUR_DIR
      cd $CUR_DIR
  done

  echo "\n\033[32mComplete!\033[0m\n"
}

function git_delete_all_other_branches {
    git branch -D `git branch | grep -v \* | xargs`
}

# Killing Backend ports
function kill_ports {
  kill-port --port 8081,8082,8083,8084,8086
  echo "\n\033[32mComplete!\033[0m\n"
}
