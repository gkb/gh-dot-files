#!/usr/local/bin/bash
# Recognize dot files correctly
shopt -s dotglob
shopt -s nullglob

files=(./sym_links/*)
for file in sym_links/* ; do
        ln -sf "$HOME/.dot-file-collection/${file}" $HOME/ ;
done
