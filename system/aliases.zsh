# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color -C"
  alias l="gls -lAh --color -C"
  alias ll="gls -l --color -C"
  alias la='gls -A --color -C'
fi