" vim builtin settings
syntax on
set number
set ignorecase
set incsearch
colorscheme zenburn
set laststatus=2
set t_Co=256
filetype plugin on

" autocomplete settings
let g:acp_behaviorKeywordLength=1

" syntastic settings
let g:syntastic_auto_jump=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checker='flake8'

