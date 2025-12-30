#!/usr/bin/env bash

modules=(
    "nvim"
    "tmux"
    "zsh"
)

for module in "${modules[@]}"; do
    echo -n "Installing $module... "
    git submodule update --init $module
    pushd "$module" > /dev/null
    ./install.sh
    popd > /dev/null
    echo "done."
done
