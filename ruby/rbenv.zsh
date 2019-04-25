# init according to main page
if (( $+commands[rbenv] ))
then
  eval "$(rbenv init - zsh --no-rehash)"
else
  ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"
  if ! rbenv versions | grep -Fq "$ruby_version"; then
    rbenv install -s "$ruby_version"
  fi
  rbenv global "$ruby_version"
  rbenv shell "$ruby_version"

  gem_install_or_update() {
    if gem list "$1" --installed > /dev/null; then
      echo "› Updating %s ..." "$1"
      gem update "$@"
    else
      echo "› Installing %s ..." "$1"
      gem install "$@"
      rbenv rehash
    fi
  }

  gem update --system
  gem_install_or_update 'bundler'
fi