#!/usr/local/bin/bash
install_dir="$HOME/.dot-file-collection"

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
if [[ ! -d "$HOME/.bin" ]]; then
        mkdir "$HOME/.bin";
fi
for file in "${bin_files[@]}"; do
        if [[ -f "$file" ]]; then
                cp "$file" "$HOME/.bin";
        fi;
done
