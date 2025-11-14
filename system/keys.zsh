# Pipe my public key to my clipboard.
# Supports both RSA and Ed25519 keys
alias pubkey="if [ -f ~/.ssh/id_ed25519.pub ]; then cat ~/.ssh/id_ed25519.pub | pbcopy && echo '=> Ed25519 public key copied to pasteboard.'; elif [ -f ~/.ssh/id_rsa.pub ]; then cat ~/.ssh/id_rsa.pub | pbcopy && echo '=> RSA public key copied to pasteboard.'; else echo 'No SSH public key found.'; fi"
