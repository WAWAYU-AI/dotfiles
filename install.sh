#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

link_file () {
  src="$1"
  dst="$2"

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "Backing up $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -s "$src" "$dst"
  echo "Linked $dst"
}

link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
