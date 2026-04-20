# reset key binding
bindkey -d

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ys"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-completions
  fzf
)

source $ZSH/oh-my-zsh.sh

# fzf default options
export FZF_DEFAULT_OPTS="--extended --ansi --multi"

# mise (replaces rbenv, direnv, starship)
eval "$(mise activate zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

export PATH="/usr/local/sbin:$PATH"

# Source custom zsh config files
for f in ~/.zsh/<->_*.zsh(n); do source $f; done
