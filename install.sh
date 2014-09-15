#!/bin/bash
source ./helpers.sh

configure_debug

set_bash_options

create_install_dir
create_symlinks

sym_link_os_specific
run_install_scripts
install_bin_files
