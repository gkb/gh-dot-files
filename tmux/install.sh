#!/usr/local/bin/bash
[[ ! -z "$DEBUG" ]] && set -x

file_dir=${0%/*}
cd "${file_dir}/tmux-MacOSX-pasteboard"

make &>/dev/null
cp reattach-to-user-namespace ../bin/
