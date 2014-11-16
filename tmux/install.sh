#!/usr/bin/env bash
tpm_plugin_dir="${HOME}/.tmux/plugins"
tpm_install_dir="${tpm_plugin_dir}/tpm"
tpm_git_url="https://github.com/tmux-plugins/tpm"

function get_tpm {
    mkdir -p "${tpm_plugin_dir}"
    if [[ ! -d "${tpm_install_dir}" ]]; then
        git clone "${tpm_git_url}" "$tpm_install_dir" &>/dev/null
    fi
}

function load_tpm_plugins {
    local install_script_relpath="scripts/install_plugins.sh"
    # Need a tmux session active to prevent the script from throwing an error
    # when it can't find a session where it can display a message
    local hacky_tmux_session_name="test"
    local shell_command="${tpm_install_dir}/${install_script_relpath}"
    tmux new-session -s "${hacky_tmux_session_name}" -d "${shell_command}"
    tmux kill-session -t "${hacky_tmux_session_name}"
}

function init {
    echo "Doing tmux specific setup"
    get_tpm
    load_tpm_plugins
}

init
