set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugin manager && looks:
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
" utilities:
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'roman/golden-ratio'
" better navigation:
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
" golang stuff
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

"" general config:

" colors:
if has("termguicolors")
    set termguicolors
endif

set background=dark
colorscheme solarized8_light_flat

set history=10000
syntax enable
setglobal fileencoding=utf-8 bomb
set encoding=utf-8
let $LANG='en_US'
set scrolloff=5         " Start scrolling five lines to the border
set hidden              " Hides buffers instead of closing them
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab           " Tabs are NOT converted to spaces
set backspace=indent,eol,start
set autoread            " If file changed outside of Vim, change without asking
set relativenumber      " Sets relative line numbering
set nonumber
set showcmd             " Display incomplete command
set autoindent          " An auto-indent
set lisp                " for lisp magic to happen
set nocursorline          " Sets line on the one where the cursor is
set showmatch           " Highlight matching [{()}]
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
set ignorecase          " Searches are case insensitive...
set smartcase           " ...unless it's beginning of the word
set novisualbell        " No beeping
set noerrorbells        " No beeping
set nobackup            " Don't do backup
set nowritebackup       " Don't do backup 
set wildmenu            " Set proper autocompition.
set path+=**            " enable recursive searching
set wildmode=list:longest
set laststatus=2
set nostartofline
set shell=zsh
set splitright          " new vertical split will be started to right


" jump to the last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


"" Key remaps and custom functions

inoremap fd <Esc>
nnoremap ; :
nnoremap : ;

map <Space> \
map Y y$
nnoremap <Leader><TAB> <C-^>
nnoremap <Backspace> :nohlsearch<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>p :CtrlP<CR>

" Better split switching
nnoremap J <C-W>j
nnoremap K <C-W>k
nnoremap H <C-W>h
nnoremap L <C-W>l

" Emacs commands in insert mode:
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

" run python, be happy
imap <F5> <Esc>:w<CR>:!clear;python %<CR>

" double %% magic - envoked in command-mode, returns current directory
cnoremap <expr> %% expand('%:h').'/'

" MULTIPURPOSE TAB KEY - indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

"" Plugins setup and varia:
" vim-sneak config
" let g:sneak#label = 1
let g:sneak#s_next = 1

" airline settings
let g:airline#extensions#tabline#enabled = 0
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline#extensions#whitespace#enabled = 0

" go colors setup:

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" color same ids
let g:go_auto_sameids = 1

" autoimport dependencies:
let g:go_fmt_command = "goimports"

" type info in command area:
let g:go_auto_type_info = 1

au FileType go nmap <F12> <Plug>(go-def)

" Enable deoplete on startup
if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif


" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction
