#!/usr/local/bin/bash
install_dir="$HOME/.dot-file-collection"
# Recognize dot files correctly
shopt -s dotglob
shopt -s nullglob

files=(./sym_links/*)
for file in sym_links/* ; do
        ln -sf "$install_dir/${file}" $HOME/ ;
done
