#!/bin/bash
echo "Doing vim specific setup"

[[ ! -z "$DEBUG" ]] && set -x

function die {
        echo "$@" 1>&2 ; exit 1;
}

function abort_if_file_exists_not_dir {
        if [[ "$#" != 1 ]]; then
                die "Invalid number of arguments supplied";
        fi
        if [[ ( -a "$1" ) && ( ! -d "$1" ) ]]; then
                die "A file by the name of $1 exists and is not a directory";
        fi
}

VIM_HOME="$HOME/.vim"
dot_file_dir="$HOME/.dot-file-collection"

# Sets up Vundle
vundle_install_dir="$HOME/.vim/bundle"
abort_if_file_exists_not_dir "$vundle_install_dir"
mkdir -p "$vundle_install_dir"

# Don't overwrite an existing checkout of Vundle
if [[ ! -d "${vundle_install_dir}/Vundle.vim" ]]; then
        git clone "https://github.com/gmarik/Vundle.vim" \
                "${vundle_install_dir}/Vundle.vim" &>/dev/null
fi

# Copy color schemes
color_install_dir="$VIM_HOME"
color_source_dir="$dot_file_dir/vim/colors"
abort_if_file_exists_not_dir "$color_install_dir"
mkdir -p "$color_install_dir"
cp -r "$color_source_dir" "$color_install_dir"

# Copy drop-in functionality
drop_in_dir="$dot_file_dir/vim/drop_in"
cp "${drop_in_dir}"/* "$VIM_HOME"

vim +BundleInstall +qall &>/dev/null || echo "Vundle set up failed!"
