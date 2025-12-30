# shortcuts
alias back='cd "$OLDPWD"'
alias c="clear"

# zsh
alias zshsrc="source ~/.zshrc"
alias zshaliases="vi ~/.dotfiles/zsh/aliases.zsh"
alias zshconf="vi ~/.dotfiles/zsh/.zshrc"
alias zshexports="vi ~/.dotfiles/zsh/exports.zsh"
alias zshfuncs="vi ~/.dotfiles/zsh/functions.zsh"
alias zshpaths="vi ~/.dotfiles/zsh/paths.zsh"

# tmux
alias tmuxconf="vi ~/.tmux.conf.local"

# editor
if command -v nvim > /dev/null; then
    alias vi="nvim"
    alias vim="nvim"
fi

# blasphemy?
if command -v exa > /dev/null; then
    alias ls="exa"
    alias ll="exa -l"
    alias la="exa -a"
    alias l="exa -la"
fi
