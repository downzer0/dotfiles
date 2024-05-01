# check if autocomplete has been installed
if [ ! -d ~/.zsh ]
then
  # create folder structure
  mkdir -p ~/.zsh
  cd ~/.zsh

  # download scripts
  curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
else
  echo "Skip: Git autocomplete is already installed"
fi