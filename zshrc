# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PROMPT='%F{cyan}${_prompt_sorin_pwd}%f${git_info:+${(e)git_info[prompt]}}%(!. %B%F{red}#%f%b.)${editor_info[keymap]} '

# history settings
setopt appendhistory histignoredups
setopt histignorespace extended_history
setopt INC_APPEND_HISTORY share_history
SAVEHIST=8096
HISTSIZE=8096

# Customize to your needs...
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# look for ey config in project dirs
export EYRC=./.eyrc

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases


# For connecting to docker from docker client
if (( $+commands[boot2docker] )) ; then
  $(boot2docker shellinit 2>/dev/null)
fi


export PATH="$PATH:"/Users/zhanwen/.npm-global/bin/""

export SERVER_DB_PWD="Bohu27936"
export SERVER_ACCESS_KEY="LTAIylmHBnaIhdON"
export SERVER_ACCESS_SECRET="ji7QYVp8gHlXne8H1aScpSeuyIlaAw"
export TB_ACCESS_KEY="26022554"
export TB_ACCESS_SECRET="be685330f8769d2f4717872e844a7003"
export PATH=/Users/zhanwen/gitlab/flutter/bin:.git/safe/../../bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:.git/safe/../../bin:/Users/zhanwen/.npm-global/bin/:/Users/zhanwen/.npm-global/bin/
export PATH=$PATH:/Users/zhanwen/gitlab/depot_tools
export KRAKEN_POLYFILL_DIR=/Users/zhanwen/gitlab/kraken/polyfill
export KRAKEN_BUNDLE_PATH=/Users/zhanwen/gitlab/kraken/app_launcher/assets/bundle.js
# export KRAKEN_LIBRARY_PATH=/Users/zhanwen/gitlab/kraken/cli/build/lib
# export KRAKEN_LIBRARY_PATH=/Users/zhanwen/gitlab/kraken/cli/build/app/debug/Kraken.app/Contents/Frameworks
# export FLUTTER_ENGINE=/Users/zhanwen/gitlab/engine/src
PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export ENABLE_KRAKEN_JS_LOG="true"


export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PUB_HOSTED_URL=https://pub.flutter-io.cn
