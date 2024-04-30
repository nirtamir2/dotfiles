#!/bin/env zsh

PS1_EMOJIS=("😀" "😃" "😄" "😁" "😆" "😅" "🤣" "😂" "🙂" "🙃" "😉" "😊" "😇" "😍" "😘" "😗" "😚" "😙" "😋" "😛" "😜" "😝" "🤑" "🤗" "🤔" "🤐" "😐" "😑" "😶" "😏" "😒" "🙄" "😬" "🤥" "😌" "😔" "😪" "🤤" "😴" "😷" "🤒" "🤕" "🤢" "🤧" "😵" "🤠" "😎" "🤓" "😕" "😟" "🙁" "😮" "😯" "😲" "😳" "😦" "😧" "😨" "😰" "😥" "😢" "😭" "😱" "😖" "😣" "😞" "😓" "😩" "😫" "😤" "😡" "😠" "😈" "👿" "💀" "💩" "🤡" "👹" "👺" "👻" "👽" "🤖" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾" "🙈" "🙉" "🙊" "💋" "💌" "💘" "💝" "💖" "💗" "💓" "💞" "💕" "💟" "💔" "💛" "💚" "💙" "💜" "💥" "💫" "💦" "💨" "💬" "💭" "💤" "👋" "🤚" "✋" "🖖" "👌" "🤞" "🤘" "🤙" "👈" "👉" "👆" "🖕" "👇" "👍" "👎" "✊" "👊" "🤛" "🤜" "👏" "🙌" "👐" "🤝" "🙏" "💅" "🤳" "💪" "👂" "👀" "👅" "👄" "👶" "👦" "👧" "👱" "👨" "👱" "👨" "👨" "👨" "👨" "👩" "👱" "👩" "👩" "👩" "👩" "👴" "👵" "🙇" "🙇" "🤦" "🤦" "🤦" "🤷" "🤷" "🤷" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👨" "👩" "👩" "🏃" "🏃" "💃" "🕺" "👯" "👯" "👯" "🤺" "🏇" "🚣" "🚣" "🚣" "🏊" "🏊" "🏊" "🚴" "🚴" "🚴" "🚵" "🚵" "🚵" "🤸" "🤸" "🤸" "🤼" "🤼" "🤼" "🤽" "🤽" "🤽" "🤾" "🤾" "🤾" "🤹" "🤹" "🤹" "🛀" "🛌" "👫" "👬" "💏" "👩" "👨" "👩" "💑" "👩" "👨" "👩" "👪" "👨" "👨" "👨" "👨" "👨" "👨" "👨" "👨" "👨" "👨" "👩" "👩" "👩" "👩" "👩" "👨" "👨" "👨" "👨" "👨" "👩" "👩" "👩" "👩" "👩" "🐵" "🐒" "🦍" "🐕" "🐺" "🦊" "🐱" "🐈" "🦁" "🐯" "🐅" "🐆" "🐴" "🐎" "🦄" "🦌" "🐮" "🐂" "🐄" "🐷" "🐖" "🐗" "🐽" "🐏" "🐑" "🐐" "🐪" "🐫" "🐘" "🦏" "🐭" "🐁" "🐀" "🐹" "🐰" "🐇" "🐻" "🐨" "🐼" "🦃" "🐔" "🐓" "🐣" "🐤" "🐥" "🐦" "🐧" "🦅" "🦆" "🦉" "🐸" "🐊" "🐢" "🦎" "🐍" "🐲" "🐉" "🐳" "🐋" "🐬" "🐟" "🐠" "🐡" "🦈" "🐙" "🐚" "🐌" "🦋" "🐛" "🐝" "🐞" "💐" "🌸" "🌹" "🥀" "🌺" "🌻" "🌼" "🌷" "🍇" "🍈" "🍉" "🍊" "🍋" "🍌" "🍍" "🍎" "🍏" "🍐" "🍑" "🍒" "🍓" "🥝" "🍅" "🥑" "🍆" "🥔" "🥕" "🌽" "🥒" "🥜" "🌰" "🍞" "🥐" "🥖" "🥞" "🍖" "🍗" "🥓" "🍔" "🍟" "🍕" "🌭" "🌮" "🌯" "🥙" "🍳" "🥘" "🍲" "🥗" "🍿" "🍱" "🍘" "🍙" "🍚" "🍛" "🍜" "🍝" "🍠" "🍢" "🍣" "🍤" "🍥" "🍡" "🦀" "🦐" "🦑" "🍦" "🍧" "🍨" "🍩" "🍪" "🎂" "🍰" "🍫" "🍬" "🍭" "🍮" "🍯" "🍼" "🥛" "☕" "🍵" "🍶" "🍾" "🍷" "🍸" "🍹" "🍺" "🍻" "🥂" "🥃" "🌍" "🌎" "🌏" "🗾" "🌋" "🗻" "⛺" "🌁" "🌃" "🌄" "🌅" "🌆" "🌇" "🌉" "🎠" "🎡" "🎢" "💈" "🎪" "🚂" "🚃" "🚄" "🚅" "🚆" "🚇" "🚈" "🚉" "🚊" "🚝" "🚞" "🚋" "🚌" "🚍" "🚎" "🚐" "🚑" "🚒" "🚓" "🚔" "🚕" "🚖" "🚗" "🚘" "🚙" "🚚" "🚛" "🚜" "🛵" "🚏" "⛽" "🚨" "🚥" "🚦" "🛑" "🚧" "⚓" "⛵" "🛶" "🚤" "🚢" "🛫" "🛬" "🚁" "🚟" "🚠" "🚡" "🚀" "⌛" "⏳" "⌚" "⏰" "🕛" "🕧" "🕐" "🕜" "🕑" "🕝" "🕒" "🕞" "🕓" "🕟" "🕔" "🕠" "🕕" "🕡" "🕖" "🕢" "🕗" "🕣" "🕘" "🕤" "🕙" "🕥" "🕚" "🕦" "🌑" "🌒" "🌓" "🌔" "🌕" "🌖" "🌗" "🌘" "🌙" "🌚" "🌛" "🌜" "🌝" "🌞" "🌟" "🌠" "🌌" "🌀" "🌈" "🌂" "☔" "⚡" "🎃" "🎄" "🎆" "🎇" "✨" "🎈" "🎉" "🎊" "🎋" "🎍" "🎎" "🎏" "🎐" "🎑" "🎀" "🎁" "🏆" "🏅" "🥇" "🥈" "🥉" "⚽" "⚾" "🏀" "🏐" "🏈" "🏉" "🎾" "🎳" "🏏" "🏑" "🏒" "🏓" "🏸" "🥊" "🥋" "🥅" "⛳" "🎣" "🎿" "🎯" "🔮" "🎮" "🎰" "🎲" "👓" "👖" "👝" "🎒" "👠" "👡" "👑" "👒" "🎩" "🎓" "📿" "💄" "💍" "💎" "🔈" "🔉" "🔊" "📢" "📣" "📯" "🔔" "🔕" "📻" "🎷" "🎸" "🎹" "🎺" "🎻" "📱" "📲" "📞" "📟" "📠" "🔋" "🔌" "💻" "💽" "💾" "💿" "📀" "🎥" "🎬" "📺" "📷" "📸" "📹" "📼" "🔍" "🔎" "💡" "🔦" "🏮" "📔" "📕" "📖" "📗" "📘" "📙" "📚" "💰" "💸" "🔨" "🔫" "🏹" "🔧" "🔩" "🔬" "🔭" "📡" "🚪" "🚿" "🛁" "🛒")
NUMBER_OF_EMOJIS=${#PS1_EMOJIS[@]}
THEME_DELIMITER="%{$fg_bold[blue]%}›%{$reset_color%}%{$fg_bold[red]%}›%{$reset_color%}%{$fg_bold[green]%}›%{$reset_color%}"

PROMPT='
%(?, ,%{$fg[red]%}FAIL: $?
%{$reset_color%})
${PS1_EMOJIS[$RANDOM % $NUMBER_OF_EMOJIS]}  $THEME_DELIMITER '

github_url() {
  # GitHub codepoint is supported by nerd fonts
  # CaskaydiaCove Nerd Font
  GITHUB_ICON=""

  if [[ "$PWD" == *"github.com"*/*/* ]]; then
    echo "%{$fg_bold[blue]%} %3/ $GITHUB_ICON"
    return
  fi

  echo ""
}

RPROMPT='$(github_url)'
