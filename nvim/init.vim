" Section Plugins {{{

" Install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""
" Colorschemes "
""""""""""""""""
Plug 'crusoexia/vim-monokai' " Make sure `set colorscheme monokai` is below

"""""""""""""
" Utilities "
"""""""""""""
" Required for deoplete
function! DoRemote(args)
  UpdateRemotePlugins
endfunction

Plug 'benekastah/neomake'             " Neovim replacement for syntastic using neovim's job control functonality
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file finder, mapped to <leader>t
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " File drawer
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Neovim replacement for YouCompleteMe for asynchronous keyword completion system in the current buffer
Plug 'tpope/vim-fugitive'             " Amazing git wrapper for vim
Plug 'tpope/vim-repeat'               " Enables repeating other supported plugins with the . command
Plug 'tpope/vim-sleuth'               " Detect indent style (tabs vs. spaces)
Plug 'tpope/vim-surround'             " Mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'vim-airline/vim-airline'        " Fancy statusline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline

" Plug 'AndrewRadev/splitjoin.vim'      " Single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
" Plug 'benmills/vimux'                 " Tmux integration for vim
" Plug 'editorconfig/editorconfig-vim'  " .editorconfig support
Plug 'ervandew/supertab'              " Perform all your vim insert mode completions with Tab
" Plug 'MarcWeber/vim-addon-mw-utils'   " Interpret a file by function and cache file automatically
" Plug 'mileszs/ack.vim'                " Search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'Raimondi/delimitMate'           " Automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'sickill/vim-pasta'              " Context-aware pasting
" Plug 'tomtom/tlib_vim'                " Utility functions for vim
" Plug 'tpope/vim-commentary'           " Comment stuff out
" Plug 'tpope/vim-dispatch'             " Asynchronous build and test dispatcher
" Plug 'tpope/vim-ragtag'               " Endings for html, xml, etc. - ehances surround
" Plug 'tpope/vim-unimpaired'           " Mappings which are simply short normal mode aliases for commonly used ex commands
" Plug 'vim-scripts/matchit.zip'        " Extended % matching

"""""""""""""""""""""""""""""
" Language-Specific Plugins "
"""""""""""""""""""""""""""""
" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }                               " Elm Support

" Javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' }                        " JavaScript support
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }              " ES2015 and beyond support
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' } " Additional JS Library support
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }                " Better indent support

" JSX
" Plug 'mxw/vim-jsx', { 'for': 'jsx' }                                   " JSX support

" NodeJS
Plug 'moll/vim-node', { 'for': 'javascript' }                          " Node support

"JSON
Plug 'elzr/vim-json', { 'for': 'json' }                                " JSON support

" Jade
" Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }                " Jade support

" HTML
Plug 'othree/html5.vim', { 'for': 'html' }                             " HTML5 support
Plug 'gregsexton/MatchTag', { 'for': 'html' }                          " Match tags in html, similar to paren support

"CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }                        " CSS3 support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }            " Set the background of hex color values to the color

" LESS
Plug 'groenewege/vim-less', { 'for': 'less' }                          " Less support

" SCSS
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }                    " Sass scss syntax support

" Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }                       " Markdown support

call plug#end()

" }}}



" Section General {{{

"""""""""""""""""
" Abbreviations "
"""""""""""""""""
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

""""""""""""""""""""""
" Essential Settings "
""""""""""""""""""""""
set nocompatible " Not compatible with vi

set autoread " Detect when a file is changed

set backspace=indent,eol,start " Make backspace behave in a sane manner

set history=1000 " Change history to 1000
set textwidth=100

let mapleader = ',' " Set a map leader for more key combos
let g:mapleader = ','

"""""""""""""""
" Tab Control "
"""""""""""""""
set noexpandtab   " Insert tabs rather than spaces for <Tab>
set smarttab      " Tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4     " The visible width of tabs
set softtabstop=4 " Edit as if the tabs are 4 characters wide
set shiftwidth=4  " Number of spaces to use for indent and unindent
set shiftround    " Round indent to a multiple of 'shiftwidth'
set completeopt+=longest

if has('mouse')
    set mouse=a
endif

set clipboard=unnamed

""""""""""""""""""""
" Faster Redrawing "
""""""""""""""""""""
set ttyfast

set diffopt+=vertical

"""""""""""""""""""""""
" Highlight Conflicts "
"""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set laststatus=2 " Show the satus line all the time

" }}}



" Section AutoGroups {{{

"""""""""""""""""""""""""""""""
" File Type Specific Settings "
"""""""""""""""""""""""""""""""
augroup configgroup
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
    autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType markdown setlocal textwidth=0 wrapmargin=0 wrap spell
    autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
    autocmd FileType crontab setlocal nobackup nowritebackup

    " Automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc.local source %

    " Save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

    " Make quickfix windows take all the lower section of the screen when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    autocmd InsertChange,TextChanged * update | Neomake
augroup END

" }}}



" Section User Interface {{{

"""""""""""""""""""""""""
" Code Folding Settings "
"""""""""""""""""""""""""
set foldmethod=syntax " Fold based on indent
set foldnestmax=10    " Deepest fold is 10 levels
set nofoldenable      " Don't fold by default
set foldlevel=1       " Fold level

set so=7                  " Set 7 lines to the cursors - when moving vertical
set wildmenu              " Enhanced command line completion
set hidden                " Current buffer can be put into background
set showcmd               " Show incomplete commands
set noshowmode            " Don't show which mode disabled for PowerLine
set wildmode=list:longest " Complete files like a shell
set scrolloff=3           " Lines of text around cursor
set shell=$SHELL          " Set the shell
set cmdheight=1           " Command bar height
set title                 " Set terminal title

"""""""""""""
" Searching "
"""""""""""""
set ignorecase   " Case insensitive searching
set smartcase    " Case-sensitive if expresson contains a capital letter
set hlsearch     " Highlight all search matches
set incsearch    " Set incremental search, like modern browsers
set nolazyredraw " Don't redraw while executing macros
set magic        " Set magic on, for regex
set showmatch    " Show matching braces
set mat=2        " How many tenths of a second to blink

"""""""""""""""
" Error Bells "
"""""""""""""""
set noerrorbells
set visualbell
set t_vb=
set tm=500

""""""""""
" Themes "
""""""""""
syntax on " Switch syntax highlighting on
set background=dark
colorscheme monokai

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256              " Explicitly tell vim that the terminal supports 256 colors"

highlight Comment cterm=italic
highlight htmlArg cterm=italic

set number " Show line numbers

set wrap         " Turn on line wrapping
set wrapmargin=8 " Wrap lines when coming within n characters from side
set linebreak    " Set soft wrapping
set showbreak=…  " Show ellipsis at breaking

set autoindent   " Automatically set indent of new line
set smartindent  " Smarter indentation

" }}}



" Section Mappings {{{

" Workaround for using the xclip system clipboard with nvim
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" Remap esc
inoremap jk <esc>

" Markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" Remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" Wipout buffer
nmap <silent> <leader>b :bw<cr>

" Shortcut to save
nmap <leader>, :w<cr>

" Disable Ex mode
noremap Q <NOP>

" Set paste toggle
set pastetoggle=<F6>

" Toggle paste mode
map <leader>v :set paste!<cr>

" Edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" Edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" Clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" Activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" Toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
set nolist
nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" Switch between current and last buffer
nmap <leader>. <c-^>

" Enable . command in visual mode
vnoremap . :normal .<cr>

" Window movement
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" Window closing
map <leader>wc :wincmd q<cr>

" Toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" Configure a command that you run often, and run the configured command.
map <leader>s :call SetCustomCommand()<cr>
map <leader>r :call RunCustomCommand()<cr>
let g:silent_custom_command = 0

" Helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>

" }}}



" Section Functions {{{

" Copy using the xclip system clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

" Paste using the xclip system clipboard
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Recursively search up from dirname, sourcing all .vimrc.local files along the way
function! ApplyLocalSettings(dirname)
    " Convert windows paths to unix style
    let l:curDir = substitute(a:dirname, '\\', '/', 'g')

    " Walk to the top of the dir tree
    let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
    if isdirectory(l:parentDir)
        call ApplyLocalSettings(l:parentDir)
    endif

    " Now walk back down the path and source .vimsettings as you find them.
    " Child directories can inherit from their parents
    let l:settingsFile = a:dirname . '/.vimrc.local'
    if filereadable(l:settingsFile)
        exec ':source' . l:settingsFile
    endif
endfunction

" Sets a custom command for use later with RunCustomCommand
function! SetCustomCommand()
    let s:customcommand = input('Enter Custom Command$ ')
endfunction

" Runs the command stored in SetCustomCommand
function! RunCustomCommand()
    up
    if g:silent_custom_command
        execute 'silent !' . s:customcommand
    else
        execute '!' . s:customcommand
    endif
endfunction

" Trims trailing whitespace in the current buffer
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

" Un-escape HTML
function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

" }}}



" Section Plugins {{{

""""""""""""
" NERDTree "
""""""""""""
let g:NERDTreeQuitOnOpen=0         " Close NERDTree after a file is opened
let NERDTreeShowHidden=1           " Show hidden files in NERDTree
let NERDTreeIgnore = ['\.js.map$'] " Remove some files by extension

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" Expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

""""""""""""
" Fugitive "
""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

"""""""""""
" Neomake "
"""""""""""
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2

""""""""""""
" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""
" CtrlP "
"""""""""
" Only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


"""""""""""
" Airline "
"""""""""""
if (has("gui_running"))
    let g:airline_powerline_fonts = 0
else
    let g:airline_powerline_fonts = 1
endif

let g:airline_theme = 'base16_monokai'

""""""""""""
" Vim-JSON "
""""""""""""
let g:vim_json_syntax_conceal = 0 " Don't hide quotes in json files

" }}}

call ApplyLocalSettings(expand('.'))
