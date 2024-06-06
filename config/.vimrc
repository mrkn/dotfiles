set nocompatible

"" python {{{
if has('mac')
  if empty($HOMEBREW_PREFIX)
    let g:python_host_prog = '/opt/homebrew/bin/python2'
    let g:python3_host_prog = '/opt/homebrew/bin/python3'
  else
    let g:python_host_prog = $HOMEBREW_PREFIX . '/bin/python2'
    let g:python3_host_prog = $HOMEBREW_PREFIX . '/bin/python3'
  endif

  let g:rbenv_global_version = trim(system('rbenv global'))
  let g:rbenv_version_prefix = $HOME . '/.rbenv/versions/' . g:rbenv_global_version
  let g:ruby_host_prog = g:rbenv_version_prefix . '/bin/ruby'
end
"" }}}

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

set ambiwidth=single
set incsearch
set hlsearch
set ruler
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let mapleader = ","
set ttimeout
set ttimeoutlen=50
set shellcmdflag=-l\ -O\ expand_aliases\ -c
set foldmethod=marker
set foldmarker={{{,}}}

"" cindent {{{
augroup CIndentation
  autocmd!
  autocmd FileType c,cpp setlocal cinoptions=l1
  autocmd BufRead,BufNewFile
\         */apache/{arrow,ARROW-*}/*.{c,cc,cpp,h,hpp}
\         setlocal cinoptions=l1,g1,h1,N-s,(0,W4
  autocmd BufRead,BufNewFile
\         */ruby/ruby{,-*}/*.{c,cc,cpp,h,hpp}
\         setlocal filetype=cruby
augroup END
"" }}}

"" relative linenumber {{{
set number
set relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"" }}}

"" colorscheme {{{
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"

if has('mac')
  if $ITERM_PROFILE == "Hotkey Window"
    set background=dark
    colorscheme Tomorrow-Night-Bright
  else
    set background=light
    colorscheme rose-pine-dawn
  end
else
  set background=dark
  colorscheme mrkn256
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
" Input mode
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
" Command-line mode
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-K> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <M-F> <S-Right>
cnoremap <M-B> <S-Left>
" Terminal mode
tnoremap <silent> <ESC> <C-\><C-n>
"" }}}

set secure
