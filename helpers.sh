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

function abort_if_install_dir_path_invalid {
        if [[ "$#" != 2 ]]; then
                die "Invalid number of arguments supplied";
        fi
        install_dir="$1"
        cur_dir="$2"
        if [[ ( -a "$install_dir" ) && ( ! -h "$install_dir" ) && \
                ( "$cur_dir" != "$install_dir" ) ]]; then
                die "The install directory '$HOME/.dot-file-collection'" \
                        "already exists and is neither a symlink nor equal" \
                        "to the containing directory";
        fi
}

function configure_debug {
        [[ ! -z "$DEBUG" ]] && set -x
}

function maybe_symlink_to_install_dir {
        install_dir="$HOME/.dot-file-collection"
        bash_source_length="${#BASH_SOURCE[@]}"
        cur_dir="$( cd -P "$( dirname \
                "${BASH_SOURCE[${bash_source_length} - 1]}" )" && pwd )"
        abort_if_install_dir_path_invalid "$install_dir" "$cur_dir"
        if [[ "$cur_dir" != "$install_dir" ]]; then
                ln -sfh "$cur_dir" "$install_dir";
        fi
}

function set_bash_options {
        # Recognize dot files correctly
        shopt -s dotglob
        shopt -s nullglob
}

function create_symlinks {
        for file in $(find -H $install_dir -name '*.symlink') ; do
                bname=$(basename $file)
                ln -sf "$file" "$HOME/.${bname%.*}"
        done
}

function _sym_link_os_specific_helper {
        local sys_specific_filename=".sys_specific"
        local os_specific_dir="${install_dir}/os_specific"

        if [[ -a "${os_specific_dir}/$1" ]] ; then
                ln -sf "${os_specific_dir}/$1" \
                        "${HOME}/${sys_specific_filename}";
        fi
}

# Symlink the os-specific profile
function sym_link_os_specific {
        case "$(uname -s)" in
        Darwin)
                _sym_link_os_specific_helper "osx_profile"
                ;;
        *)
                # Assume that it's a unix box by default
                _sym_link_os_specific_helper "unix_profile"
                ;;
        esac
}

# Run all install files in sub-directories
function run_install_scripts {
        # Exclude current file although it's named install.sh as well
        # Use the -H option in `find` to follow the symlink that is $install_dir
        for file in $(find -H $install_dir -mindepth 2 -name 'install.sh') ; do
                bash "$file";
        done
}

# Install all bin files in $bin_dir
function install_bin_files {
        bin_dir="$HOME/.bin"
        abort_if_file_exists_not_dir "$bin_dir"
        mkdir -p "$bin_dir";
        # Use the -H option in `find` to follow the symlink that is $install_dir
        for file in $(find -H "$install_dir" -path '*bin/*'); do
                if [[ -f "$file" ]]; then
                        cp "$file" "$HOME/.bin";
                fi;
        done
}

function init {
        configure_debug

        set_bash_options

        maybe_symlink_to_install_dir
        create_symlinks

        sym_link_os_specific
        run_install_scripts
        install_bin_files
}
