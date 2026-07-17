#!/usr/bin/env bash

set -euo pipefail

echo "==> Creating directories..."
mkdir -p ~/.config
mkdir -p ~/.local/bin

echo "==> Removing existing configs..."
rm -rf ~/.config/nvim
rm -rf ~/.config/kitty
rm -f ~/.bashrc
rm -f ~/.tmux.conf
rm -f ~/.local/bin/tmux-fzf-start
rm -f ~/.local/bin/tmux-sessionizer

echo "==> Creating symlinks..."
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/kitty" ~/.config/kitty
ln -s "$(pwd)/.bashrc" ~/.bashrc
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/tmux-fzf-start" ~/.local/bin/tmux-fzf-start
ln -s "$(pwd)/tmux-sessionizer" ~/.local/bin/tmux-sessionizer

chmod +x \
    ~/.local/bin/tmux-fzf-start \
    ~/.local/bin/tmux-sessionizer

echo
echo "Done!"
echo "Restart your terminal or run:"
echo "  source ~/.bashrc"
