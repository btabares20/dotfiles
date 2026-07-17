#!/usr/bin/env bash
# prepare bashrc
cp .bashrc ~/
source ~/.bashrc

# setup dev things
cp -R nvim/ ~/.config/
cp -R kitty/ ~/.config/

# prepare tmux
cp .tmux.conf ~/
chmod +x tmux-fzf-start
chmod +x tmux-sessionizer

mkdir -p ~/.local/bin/
cp tmux-fzf-start ~/.local/bin/
cp tmux-sessionizer ~/.local/bin/


