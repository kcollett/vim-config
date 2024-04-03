"
" Initial configuration suggested at
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" See also https://vimcolorschemes.com
"
" Initial Setup:
"
"   mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   restart vim
"   :PlugInstall
"
" Folding Commands:
"
"   zo open  fold under cursor
"   zc close   "    "     "
"   zR open  all folds in file
"   zM close  "    "    "  "

" BASICS        --- {{{

" Enable modelines
set modeline
set modelines=5

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Line numbering
set number

" Make it relative
set relativenumber

" share clipboard with with OS
set clipboard=unnamedplus

" this seems useful
set breakindent

" save undo history in a file
set undofile

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn " this is much too busy

" tabs setup
set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set autoindent
" set smartindent

" Do not save backup files.
set nobackup

" keep signcolumn on by default
set signcolumn=yes

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=4

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" allow movement keys to move cursor to adjoining lines
set whichwrap=h,l,<,>,[,]

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search, unless you include capital letters.
set ignorecase
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" MAPPINGS      --- {{{

" Use <Space> as our <Leader> character
map <Space> <Leader>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz
" TODO: Also for backward searches?

" Some wrapped-lines magic stolen from
" https://www.reddit.com/r/vim/comments/a8mp8z/comment/ecc0aw4/?utm_source=share&utm_medium=web2x&context=3
nnoremap <expr> j (v:count > 4 ? "m'" . v:count . 'j' : 'gj')
nnoremap <expr> k (v:count > 4 ? "m'" . v:count . 'k' : 'gk')


" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit,
" but these mappings can by useful.
nnoremap <leader>sh <c-w>s
nnoremap <leader>sv <c-w>v
" make current window only one (i.e. maximize)
" nnoremap <leader>sm <<cmd>only<CR>
nnoremap <leader>sm <<cmd>MaximizerToggle<CR>
" equalize all splits
nnoremap <leader>se <c-w>=
" close window
nnoremap <leader>sx <cmd>close<CR>

" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" }}}

" STATUS LINE   --- {{{

" set showcmdloc=statusline

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=%-25(\ %f\ %m\ %y\ %r%)

" Divider
set statusline+=%=

" Status line middle
set statusline+=buffer\ %n

" Divider
set statusline+=%=

" Status line right side.
set statusline+=\ %03b\ /\ 0x%02B\ %4l\ /\ %-3c\ %3p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" PLUGINS       --- {{{

" see vim-plug at https://github.com/junegunn/vim-plug?tab=readme-ov-file

call plug#begin('~/.vim/plugged')

Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'szw/vim-maximizer'

call plug#end()

colorscheme moonfly

" }}}

" 
" vim: foldmethod=marker:
"
