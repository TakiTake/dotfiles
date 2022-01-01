zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async", from:github

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mollifier/anyframe"
zstyle ":anyframe:selector:peco:" command 'peco'

zplug "~/.zsh", from:local, use:"<->_*.zsh"

