#!/bin/bash

. ./lib.sh

lib_logmod "" "Hello!"

for mod_file in modules/*.sh; do
  lib_logmod "dotfiles" "Running module $mod_file..."
  (cd modules && bash `basename $mod_file`)
done
