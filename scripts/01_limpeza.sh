#!/bin/bash

echo "🧹 Limpando configurações antigas..."

rm -rf ~/.oh-my-zsh ~/.zshrc ~/.zprofile ~/.zlogin ~/.zshenv ~/.config/starship.toml ~/.zsh

if [ -d "$HOME/.config/starship" ]; then
  rm -rf "$HOME/.config/starship"
fi

pamac remove -o --no-confirm
pamac clean --no-confirm

echo "✅ Limpeza concluída."
