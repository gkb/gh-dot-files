# vim: ft=sh ts=2 sts=2 sw=2 expandtab
# Provide for tab completion in rbenv
source ~/.rbenv/completions/rbenv.bash

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
