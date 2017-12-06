#!/bin/bash

Modules=node_modules/
Bin=$Modules/.bin
Package=shellcheck

echo "Test results:"
echo

for Command in "npm install" "npm install --unsafe-perm=true" "yarn install"; do
  rm -rf $Modules
  $Command 1>&2
  echo -n "$Command: $Package package "
  if [[ -e $Modules/$Package ]]; then
    echo "installed"
  else
    echo "not installed"
  fi
  echo -n "$Command: $Package binary "
  if [[ -e $Bin/shellcheck ]]; then
    echo "installed"
  else
    echo "not installed"
  fi
  rm -rf $Modules
  echo
done
