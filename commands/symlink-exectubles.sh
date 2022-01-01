FROM_DIR="$CONFIG_DIR/.bin"
TARGET_DIR=~/.bin
log_section_start "Sym linking $FROM_DIR to $TARGET_DIR"

rm "$TARGET_DIR"
symlink "$FROM_DIR" "$TARGET_DIR"

#