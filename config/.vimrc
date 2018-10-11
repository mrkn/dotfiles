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
  " rtp does not worked in toml file
  call dein#add('chriskempson/tomorrow-theme', { 'rtp': 'vim' })
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

set ambiwidth=double
set incsearch
set hlsearch
set number
set ruler
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let mapleader = ","
set ttimeout
set ttimeoutlen=50

"" colorscheme {{{
if has('gui_running')
  set background=light
else
  set background=light
end

let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"

if $ITERM_PROFILE == "Hotkey Window"
  set background=dark
  colorscheme Tomorrow-Night-Bright
else
  colorscheme solarized
end

" background toggle keymap
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
"" }}}

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

"" Key mappings {{{
" Command-line mode
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-K> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <M-F> <S-Right>
cnoremap <M-B> <S-Left>
" Terminal mode
tnoremap <silent> <ESC> <C-\><C-n>
"" }}}

set secure
