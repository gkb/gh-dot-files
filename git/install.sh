cur_file="${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]}"
cur_dir="$(dirname "${cur_file}")"
ln -hsf "${cur_dir}/git_template" "$HOME/.git_template"