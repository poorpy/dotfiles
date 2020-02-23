filetype plugin indent on

set number relativenumber

set ruler

set tabstop=4
set shiftwidth=4
set expandtab

set noswapfile
set nobackup
set nowritebackup
set noshowmode
set cmdheight=2
set shortmess+=c

set updatetime=300

set encoding=utf-8
set ignorecase
set smartcase

set hidden
set nowrap

set mouse=a

set cursorline
set completeopt-=preview

set signcolumn=yes

for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap <silent>' . s:c . ' :nohlsearch<CR>' . s:c
endfor

if (has("termguicolors"))
    set termguicolors
endif

set background=dark
