#!/usr/local/bin/bash
[[ ! -z "$DEBUG" ]] && set -x

VIM_HOME="$HOME/.vim"
dot_file_dir="$HOME/.dot-file-collection"

# Helper function
mkdir_not_exist() {
        if [[ ! -d "$1" ]]; then
                mkdir -p "$1";
        fi
}

# Sets up Vundle
vundle_install_dir="$HOME/.vim/bundle"
mkdir_not_exist "$vundle_install_dir"

# Don't overwrite an existing checkout of Vundle
if [[ ! -d "${vundle_install_dir}/vundle" ]]; then
        git clone https://github.com/gmarik/vundle.git \
                "${vundle_install_dir}/vundle";
fi

# Copy color schemes
color_install_dir="$VIM_HOME"
color_source_dir="$dot_file_dir/vim/colors"
mkdir_not_exist "$color_install_dir"
cp -r "$color_source_dir" "$color_install_dir"

# Copy drop-in functionality
drop_in_dir="$dot_file_dir/vim/drop_in"
cp "${drop_in_dir}"/* "$VIM_HOME"

vim +BundleInstall +qall &>/dev/null || echo "Vundle set up failed!"
