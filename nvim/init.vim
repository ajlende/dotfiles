set nocompatible
filetype on
set mouse=a


" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" Vim Plug Plugins
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
" Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdtree'

Plug 'whatyouhide/vim-gotham'

call plug#end()


" Colors/Styles
set t_Co=256
set background=dark
if (has("termguicolors"))
  " set t_8f=[38;2;%lu;%lu;%lum
  " set t_8b=[48;2;%lu;%lu;%lum
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
colorscheme nms
let g:nms_background=1
