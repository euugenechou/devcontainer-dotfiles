# theme
ZSH_THEME="milktea"

export ZSH=$HOME/.oh-my-zsh         # path to oh-my-zsh installation
export DOTFILES=$HOME/.dotfiles     # path to dotfiles
export LC_ALL=en_US.utf-8           # language stuff
export LANG="$LC_ALL"               # more language stuff
export UPDATE_ZSH_DAYS=14           # updates are tolerated

if command -v nvim > /dev/null; then
    export EDITOR='nvim'            # the superior editor
else
    export EDITOR='vim'            # the superior editor
fi

# custom zsh directory
ZSH_CUSTOM=$DOTFILES/zsh

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# don't autocd
unsetopt autocd

# plugin manager
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "wfxr/forgit", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "softmoth/zsh-vim-mode", defer:2

# install missing plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load plugins
zplug load

# highlighting
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#676e7b'

# custom keybindings.
bindkey '^F' autosuggest-accept
bindkey ' ' magic-space
bindkey '^J' fzf-cd-widget
VIM_MODE_VICMD_KEY='jj'

# other stuff
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
