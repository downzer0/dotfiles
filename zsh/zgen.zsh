source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
echo "Creating a zgen save"

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto utility    
    zgen prezto autosuggestions
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search
    zgen prezto spectrum
    zgen prezto prompt   
 
    zgen load djui/alias-tips
    zgen load supercrabtree/k
    zgen load agkozak/zsh-z
    zgen load mafredri/zsh-async

    #completions
    zgen load zsh-users/zsh-completions src

    # prompt
    zgen prezto prompt theme 'pure'

    #save to init script
    zgen save
fi
