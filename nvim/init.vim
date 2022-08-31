" ###############################
" ## poorpy's nvim config file ##
" ###############################

" basic settings {{{
" welcome in 21st century
filetype plugin indent on

" add filetype plugins folder to runtimepath
set runtimepath+=~/.config/nvim/ftplugin

" line numbers
set number relativenumber

" set tab to 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" highlight cursorline 
set cursorline

" disable swap, backup, insert prompt 
set noswapfile nobackup nowritebackup noshowmode

" shorten status messages
set shortmess+=c

" set delay for autocommand events
set updatetime=300

" smart case matching in search
set ignorecase smartcase

" hide buffer on closing
set hidden

" mouse support
set mouse=a

" disable extra information about currently selected completion
set completeopt-=preview

" always display signcolumn
set signcolumn=yes

" enable 24-bit RGB
set termguicolors

" disable highlighting of searched elemnts after entering insert mode
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap <silent>' . s:c . ' :nohlsearch<CR>' . s:c
endfor

" set nvr as git editor in terminal buffers
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

" close git commit window after :wq
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

" use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" }}}

" minimal keybindings {{{
" set space as leader key
map <Space> <leader>

" use alt + hjkl to switch focused split
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" use alt + shift + jk to swap tabs 
tnoremap <A-J> <C-\><C-N>gT
tnoremap <A-K> <C-\><C-N>gt
inoremap <A-J> <C-\><C-N>gT
inoremap <A-K> <C-\><C-N>gt
nnoremap <A-J> gT
nnoremap <A-K> gt



" open netrw 
nnoremap <leader>n :Explore<CR>

" use jj to return to normal mode 
inoremap jj <Esc>
" }}}

" plugins {{{ 
call plug#begin('~/.local/share/nvim/plugged/')

" tpope {{{
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
" }}}

" language packs, vim frameworks {{{
  Plug 'neomake/neomake'
  Plug 'mboughaba/i3config.vim'
  Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'lambdalisue/suda.vim'
" }}}

" snippets {{{
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" }}}

" latex, markdown, uml {{{
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

  Plug 'lervag/vimtex'
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" }}}

" movements, searching, browser {{{
  Plug 'justinmk/vim-sneak'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tyru/open-browser.vim'

let g:sneak#label =1
" fzf {{{
  Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
" }}}
" }}}

" coc {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
"}}}

" colorscheme, airline {{{
  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'vim-airline/vim-airline'
"" }}}

call plug#end()
" }}}

" neomake {{{
call neomake#configure#automake('w')
let g:neomake_open_list = 2
" }}}

" multiple cursors settings {{{
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" }}}

" ultisnips {{{
" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:airline_theme='deep_space'
let g:airline_powerline_fonts = 1
" }}}

" ansible {{{
au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
" }}}

" latex {{{
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_syntax_enabled = 0
" }}}

" colorscheme {{{
colorscheme deep-space
" invert matching paren highlight
hi MatchParen guifg=#c47ebd guibg=#51617d
" }}}

" coc {{{
" coc.nvim bindings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" coc-yank
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" format code
nnoremap <leader> F :call CocAction('format')<CR>

" fix code
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }
" }}}

" go {{{
" organize and add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" run gofmt on save
autocmd BufWritePost *.go silent! !gofmt -w %

let g:neomake_go_golangci_lint_args = neomake#makers#ft#go#golangci_lint().args + ['--allow-parallel-runners']
" }}}

" misc commands {{{
" set windows to equal size after window resize
autocmd VimResized * wincmd =

" save folds after closing file
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave ?* nested silent! mkview
    autocmd BufWinEnter ?* silent! loadview
augroup END

" set syntax filetype for html files
augroup DjangoHtml
    autocmd BufRead,BufNewFile *.html set filetype=htmldjango 
augroup END

" set syntax filetype for tex files
augroup DjangoHtml
    autocmd BufRead,BufNewFile *.tex set filetype=latex 
augroup END

" set systax highlight for i3 config file
augroup i3config_ft
    autocmd!
    autocmd BufRead,BufNewFile ~/.config/i3/config set filetype=i3config
augroup END

"enable polish spellcheck
command! Pol execute ":set spelllang=pl spell"
"enable english spellcheck
command! Eng execute ":set spelllang=en spell"

" save with root privileges
cmap w!! w !sudo tee % >/dev/null

" format rust source file using cargo
command! CargoFmt execute ":silent !cargo fmt"

" add missing imports in golang
autocmd BufWritePre *.go silent! call CocAction('runCommand', 'editor.action.organizeImport')

" run formmating on save in golang
autocmd BufWritePost *.go silent! !gofmt -w %

" }}}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  },
}
EOF
