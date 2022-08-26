ghq_list_path_peco() {
  ghq list -p "$1" | peco
}

cd_ghq_list_path_peco() {
  cd "$(ghq_list_path_peco "$@")"
}
