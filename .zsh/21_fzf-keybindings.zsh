# fzf keybindings for git, ghq, and history

# git branch checkout (^g^b)
function fzf-git-checkout() {
  local branch
  branch=$(git branch -a | fzf --prompt="branch> " | sed 's|remotes/origin/||' | tr -d ' ')
  if [[ -n "$branch" ]]; then
    git checkout "$branch"
    zle reset-prompt
  fi
}
zle -N fzf-git-checkout
bindkey '^g^b' fzf-git-checkout

# cd to ghq repository (^g^g)
function fzf-ghq-cd() {
  local repo
  repo=$(ghq list | fzf --prompt="repo> ")
  if [[ -n "$repo" ]]; then
    cd "$(ghq root)/$repo"
    zle reset-prompt
  fi
}
zle -N fzf-ghq-cd
bindkey '^g^g' fzf-ghq-cd

# insert history entry at cursor (^g^h)
function fzf-put-history() {
  local cmd
  cmd=$(fc -l 1 | fzf --tac --prompt="history> " | sed 's/^ *[0-9]* *//')
  if [[ -n "$cmd" ]]; then
    LBUFFER="$cmd"
    zle reset-prompt
  fi
}
zle -N fzf-put-history
bindkey '^g^h' fzf-put-history

# execute history entry (^g^r)
function fzf-execute-history() {
  local cmd
  cmd=$(fc -l 1 | fzf --tac --prompt="history> " | sed 's/^ *[0-9]* *//')
  if [[ -n "$cmd" ]]; then
    BUFFER="$cmd"
    zle accept-line
  fi
}
zle -N fzf-execute-history
bindkey '^g^r' fzf-execute-history
