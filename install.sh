#!/bin/bash
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

[[ ! -z "$DEBUG" ]] && set -x

install_dir="$HOME/.dot-file-collection"
abort_if_file_exists_not_dir "$install_dir"
mkdir -p "$install_dir";

# Recognize dot files correctly
shopt -s dotglob
shopt -s nullglob

for file in $(find -H $install_dir -name '*.symlink') ; do
        bname=$(basename $file)
        ln -sf "$file" "$HOME/.${bname%.*}"
done

sym_link_os_specific() {
        local sys_specific_filename=".sys_specific"
        local os_specific_dir="${install_dir}/os_specific"

        if [[ -a "${os_specific_dir}/$1" ]] ; then
                ln -sf "${os_specific_dir}/$1" \
                        "${HOME}/${sys_specific_filename}";
        fi
}

# Symlink the os-specific profile
case "$(uname -s)" in
Darwin)
        sym_link_os_specific "osx_profile"
        ;;
*)
        # Assume that it's a unix box by default
        sym_link_os_specific "unix_profile"
        ;;
esac

# Run all install files in sub-directories
# Exclude current file although it's named install.sh as well
for file in $(find -H $install_dir -mindepth 2 -name 'install.sh') ; do
        bash "$file";
done

bin_files=(**/bin/*)
bin_dir="$HOME/.bin"
abort_if_file_exists_not_dir "$bin_dir"
mkdir -p "$bin_dir";
for file in "${bin_files[@]}"; do
        if [[ -f "$file" ]]; then
                cp "$file" "$HOME/.bin";
        fi;
done
