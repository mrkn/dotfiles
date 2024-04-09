export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --preview 'if test -f {}; then cat {}; elif test -f {}/README.md; then cat {}/README.md; fi'"

ghq_list_path_fzf() {
  ghq list -p "$1" | fzf-tmux -d 15
}

cd_ghq_list_path_fzf() {
  cd "$(ghq_list_path_fzf "$@")"
}
