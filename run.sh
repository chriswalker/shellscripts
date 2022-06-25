#!/usr/bin/env bash

install() {
  printf "Executing 'install' with %s, %s\n" "${1}" "${2}"
}

shellcheck() {
  # shellcheck -fgcc -Cnever
  printf "Running shellcheck..."
  shellcheck -fgcc -Cnever *
}

shfmt() {
  printf "Executing shfmt..."
}

help() {
  printf "%s <task> <args>\n" "$0"
  printf "Tasks:\n"
  compgen -A function | cat -n
}

die() {
  printf "%s\n" "$@"
  exit 1
}

action="$1"
case $action in
  install | shellcheck | help)
    "$@"
    ;;
  *)
    die "invalid action '${action}'"
    ;;
esac
