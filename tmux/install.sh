#!/usr/local/bin/bash
file_dir=${0%/*}
cd "${file_dir}/tmux-MacOSX-pasteboard"

make &>/dev/null
cp reattach-to-user-namespace ../bin/
