alias bi='bundle install'
alias be='bundle exec'

case "${OSTYPE}" in
  darwin*)
    alias ls='ls -GF'
    ;;
  linux*)
    alias ls='ls --color -F'
    ;;
esac
