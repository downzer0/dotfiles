# Change node version manager to Volta

export VOLTA_HOME="$HOME/.volta"; [[ :$PATH: == *":$VOLTA_HOME/bin:"* ]] || PATH+=":$VOLTA_HOME/bin"