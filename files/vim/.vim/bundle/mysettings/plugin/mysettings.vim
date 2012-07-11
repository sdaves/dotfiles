" Vim builtin settings
set nocompatible

filetype off
filetype plugin indent on
syntax on

set t_Co=256
let mapleader=","
let maplocalleader = "\\"
set statusline=\ %f%m%r%h%w\ %=%({%{fugitive#statusline()}\|%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)

set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)



set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation
set modelines=0
set relativenumber
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" syntastic settings
let g:syntastic_auto_jump=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checker='flake8'

" maps
nnoremap <leader>ev :vsplit ~/.vim/bundle/mysettings/plugin/mysettings.vim<cr>
nnoremap <leader>sv :source ~/.vim/bundle/mysettings/plugin/mysettings.vim<cr>

inoremap jk <esc>
cnoremap jk <esc>
vnoremap jk <esc>

nnoremap <esc> <nop>
inoremap <esc> <nop>
cnoremap <esc> <nop>
vnoremap <esc> <nop>

nnoremap <left> <nop>
inoremap <left> <nop>
cnoremap <left> <nop>
vnoremap <left> <nop>

nnoremap <right> <nop>
inoremap <right> <nop>
cnoremap <right> <nop>
vnoremap <right> <nop>

nnoremap <up> <nop>
inoremap <up> <nop>
cnoremap <up> <nop>
vnoremap <up> <nop>

nnoremap <down> <nop>
inoremap <down> <nop>
cnoremap <down> <nop>
vnoremap <down> <nop>

onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap ; :

nmap <leader>p <M-p>
nmap <leader>P <M-P>

vnoremap < <gv
vnoremap > >gv

" autocommands
augroup all_aus
au!
au FileType javascript nnoremap <buffer> <localleader>c I//
au FileType python     nnoremap <buffer> <localleader>c I#
au BufLeave,FocusLost * silent! wall
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufEnter,InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" autocomplete settings
let g:acp_behaviorKeywordLength=1

" colorscheme
colorscheme zenburn
