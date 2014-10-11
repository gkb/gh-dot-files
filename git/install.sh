cur_file="${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]}"
cur_dir="$(dirname "${cur_file}")"

function create_git_template() {
        ln -hsf "${cur_dir}/git_template" "$HOME/.git_template"
}

function create_global_gitignore() {
        git_config_dir="$HOME/.config/git"
        mkdir -p "${git_config_dir}"
        ln -sf "$cur_dir/gitignore/ignore" "$git_config_dir"
}

create_git_template
create_global_gitignore
