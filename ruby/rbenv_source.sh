# vim: ft=sh ts=2 sts=2 sw=2 expandtab
# Provide for tab completion in rbenv
export rbenv_completion_dir="$HOME/.rbenv/completions"
export rbenv_completion_file="${rbenv_completion_dir}/rbenv.bash"
export github_url_completion_file="https://raw.githubusercontent.com/sstephenson/rbenv/master/completions/rbenv.bash"
if [[ ! -f "$rbenv_completion_file" ]]; then
  mkdir -p "$rbenv_completion_dir"
  (cd "$rbenv_completion_dir"; curl -O "$github_url_completion_file");
fi
source "$rbenv_completion_file"

# Adding another function for rbenv to work smoothly
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}
