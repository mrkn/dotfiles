set nocompatible
set encoding=utf-8

syntax on

set incsearch
set hlsearch
set number
set ruler
set shiftwidth=2
set softtabstop=2
set expandtab

set background=dark
colorscheme desert
set secure

"" GetBufferDirectory {{{
if !has('kaoriya')
  cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>
  function! s:GetBufferDirectory()
    let path = expand('%:p:h')
    let cwd = getcwd()
    let dir = '.'
    if match(path, escape(cwd, '\')) != 0
      let dir = path
    elseif strlen(path) > strlen(cwd)
      let dir = strpart(path, strlen(cwd) + 1)
    endif
    return dir . (exists('+shellslash') && !&shellslash ? '\' : '/')
  endfunction
endif
"" }}}
