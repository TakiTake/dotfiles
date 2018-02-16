#!/bin/sh
THIS=$(basename $0)
WORKING_DIR=$(dirname $0)

cd $WORKING_DIR

for dotfile in $(find $PWD -maxdepth 1 ! \( -name $THIS -o -name '.git' -o -name '.config' \)); do
  if [ $dotfile != $PWD ]; then
    ln -is $dotfile $HOME
  fi
done

mkdir -p "${HOME}/.config"
for config in $(find "${PWD}/.config" -maxdepth 1); do
  if [ $config != "${PWD}/.config" ]; then
    ln -is $config "${HOME}/.config"
  fi
done

cd -
