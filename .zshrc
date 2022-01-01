# reset key binding
bindkey -d

if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

if [[ ! -d ~/.config/base16-shell ]]; then
  mkdir -p ~/.config
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

export ZPLUG_LOADFILE=~/.zsh/zplug.zsh

source ~/.zplug/init.zsh

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '

  if read -q; then
    echo; zplug install
  fi
fi

zplug load

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
export PATH="/usr/local/sbin:$PATH"
