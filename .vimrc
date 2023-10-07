inoremap jk <ESC>
let mapleader = "'"
syntax enable
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set nocompatible
set clipboard+=unnamedplus
set cursorline
hi Cursorline cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
set laststatus=2
noremap Q gqq
nnoremap <leader>r :s///g<Left><Left>
nnoremap <leader>rc :s///gc<Left><Left><Left>

xnoremap <leader>r :s///g<Left><Left>
xnoremap <leader>rc :s///gc<Left><Left><Left>

filetype plugin on
command S :execute ':silent w !sudo tee % > /dev/null' | :edit!
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
