#!/bin/bash
#
# Install Oh My Zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."

  # Install Oh My Zsh with --unattended flag
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Oh My Zsh installer overwrites .zshrc, so restore our dotfiles symlink
  if [ -f "${HOME}/.zshrc" ] && [ ! -L "${HOME}/.zshrc" ]; then
    echo "Restoring dotfiles .zshrc symlink..."
    rm "${HOME}/.zshrc"
    ln -s "${HOME}/.dotfiles/zsh/zshrc.symlink" "${HOME}/.zshrc"
  fi

  echo "🌈 Oh My Zsh installed."
else
  echo "🌈 Oh My Zsh installed."
fi
echo ""
