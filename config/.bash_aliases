alias bi='bundle install'
alias be='bundle exec'

if type -p cd_ghq_list_path_peco; then
  alias .='cd_ghq_list_path_peco'
fi

case "${OSTYPE}" in
  darwin*)
    alias ls='ls -GF'
    ;;
  linux*)
    alias ls='ls --color -F'
    ;;
esac
