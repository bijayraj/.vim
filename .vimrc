"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimrc file for Bijay Raj Paudel
"
"Basic vimrc file
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Autoreload the config file for vim when .vimrc changes
" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Setup Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""Section below is configuration that I have collected from various sources

"Enable line number
set nu

"Search down the subfolders
set path+=**

"Make colors pop- More bright colors
"set termguicolors

"Enable filetype plugins
filetype plugin on
filetype indent on

"Set to autoread when file is changed from outside
set autoread
au FocusGained, BufEnter * checktime

"Map leader key. It can enable some extra combinations
let mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>

""EDITOR THINGS
"wildmenu - for listing files using :find
set wildmenu 

"ignore compiled file in wildmenu
set wildignore=*.o,*~,~.pyc

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"show current position
set ruler

"Height of command bar
"set cmdheight=1

"A buffer becomes hidden when it is abandoned
set hid

"Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase

"When searching try to be smart
set smartcase

"Highlight search results
set hlsearch

"Incremental search -> highlight as you type
set incsearch

"Dont redraw while performing marcros
set lazyredraw

"for regular expressions, turn magic on my default
set magic

"show matching brackets when over them
set showmatch

"how many tents of a second to blink when batching brackets
set mat=2

"No annoying sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Add some margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""
"Colors and fonts
""""""""""""""""""""""""""""""""""""""""""
"enable syntax highlihting
syntax enable

set background=dark

set encoding=utf8

"set unix as standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" ===> Tabs and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"use space instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

"1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


set ai "Auto indent
set si "Smart indent
set wrap "wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ==> Status line related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"always show status line
set laststatus=2

"format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> CLIPBOARD 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
" """""""""""""""""""""""""""""""""""
"
"Returns true is paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nooperation map for arrow keys to help learn vim
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs related thing
" """"""""""""""""""""""""""""""""""""""""""""""""""""""
"
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm: tabmove<cr>
map <leader>t<leader> :tabnext

"Let tl toggle between this and last accessed tab
let g:lasttab=1
nmap <leader>t1 :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Window related mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Buffers related mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


"---------AIRLINE RELATED---------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle = 3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-b> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
