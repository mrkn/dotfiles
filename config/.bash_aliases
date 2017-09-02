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

alias sha1='openssl dgst -sha1 -hex'
alias sha256='openssl dgst -sha256 -hex'
alias sha512='openssl dgst -sha512 -hex'

alias prime?='ruby -rprime -e "p ARGV[0].to_i.prime?"'
