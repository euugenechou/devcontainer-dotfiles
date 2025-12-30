#!/usr/bin/env bash

# Install oh-my-zsh.
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zplug.
if [[ ! -d "$HOME/.zplug" ]]; then
    git clone "https://github.com/zplug/zplug" "$HOME/.zplug"
fi

# Install fzf
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Relink configuration.
rm -f "$HOME/.zshrc"
rm -f "$HOME/.oh-my-zsh/themes/milktea.zsh-theme"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/milktea.zsh-theme" "$HOME/.oh-my-zsh/themes/milktea.zsh-theme"
