zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mollifier/anyframe"
zstyle ":anyframe:selector:peco:" command 'peco'

zplug "stedolan/jq", \
    as:command, \
    from:gh-r, \
    rename-to:jq

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"

zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt"

zplug "peco/peco", \
    as:command, \
    from:gh-r

zplug "motemen/ghq", \
    as:command, \
    from:gh-r, \
    rename-to:ghq

zplug "direnv/direnv", \
    as:command, \
    from:gh-r, \
    rename-to:direnv

zplug "~/.zsh", from:local, use:"<->_*.zsh"

