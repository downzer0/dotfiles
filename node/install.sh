#!/bin/sh
#
# n
#
# Installs volta (node version manager)

# Check for volta
if test ! $(which volta)
then
  echo "- Installing Volta..."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl https://get.volta.sh | bash)"
  fi

  echo "- n installation complete..."
fi

exit 0