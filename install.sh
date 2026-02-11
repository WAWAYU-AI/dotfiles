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
  echo "Linked $dst -> $src"
}

echo "Installing dotfiles from $DOTFILES_DIR"
echo "---------------------------------------"

# Zsh
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Bash
link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

# Git
link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Tmux
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "---------------------------------------"
echo "Dotfiles installation complete ✅"

