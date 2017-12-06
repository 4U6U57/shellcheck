#!/bin/bash

Modules=node_modules/
Bin=$Modules/.bin

for Command in "npm install" "npm install --unsafe-perm=true" "yarn install"; do
  echo "Testing $Command"
  rm -rf $Modules
  $Command
  echo
  if [[ -e $Modules/shellcheck ]]; then
    echo "shellcheck package installed"
  else
    echo "shellcheck package not installed"
  fi
  if [[ -e $Bin/shellcheck ]]; then
    echo "shellcheck binary installed"
  else
    echo "shellcheck binary not installed"
  fi
  rm -rf $Modules
  echo
done
