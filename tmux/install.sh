#!/usr/bin/env bash

# Relink configuration.
rm -rf "$HOME/.config/tmux"
ln -sf "$PWD" "$HOME/.config/tmux"
