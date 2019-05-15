#!/bin/bash
if [ ! -d "${HOME}/.zgen" ]; then
  cd ~
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi
