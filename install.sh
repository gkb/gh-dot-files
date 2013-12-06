#!/usr/local/bin/bash
install_dir="$HOME/.dot-file-collection"
# Recognize dot files correctly
shopt -s dotglob
shopt -s nullglob

for file in sym_links/* ; do
        ln -sf "$install_dir/${file}" $HOME/ ;
done

sys_specific_filename=".sys_specific"
# Symlink the os-specific profile
case "$(uname -s)" in
Darwin)
        if [[ -a "${install_dir}/os_specific/osx_profile" ]] ; then
                ln -sf "${install_dir}/os_specific/osx_profile" \
                        "${HOME}/${sys_specific_filename}";
        fi
        ;;
*)
        ;;
esac
