set nocompatible

"" dein {{{
let s:plugin_dir = expand('~/.cache/dein')
let s:dein_dir = s:plugin_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

execute 'set runtimepath^=' . s:dein_dir

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
  call dein#load_toml('~/.dein.toml', { 'lazy': 0 })
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install('vimproc')
endif
if dein#check_install()
  call dein#install()
endif
"" }}}

set encoding=utf-8

filetype plugin indent on
syntax on

set incsearch
set hlsearch
set number
set ruler
set autoindent
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
