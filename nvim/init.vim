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

" search highlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
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
let g:polyglot_disabled = ['latex', 'cuesheet',]
  Plug 'mboughaba/i3config.vim'
  Plug 'jjo/vim-cue'
  Plug 'neomake/neomake'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'Shatur/neovim-session-manager'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'rodjek/vim-puppet'
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
  Plug 'weirongxu/plantuml-previewer.vim' 
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" }}}

" movements, searching, browser {{{
  " Plug 'cloudhead/neovim-fuzzy'
  Plug 'justinmk/vim-sneak'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tyru/open-browser.vim'
  Plug 'terryma/vim-multiple-cursors'

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

" latex {{{
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
" }}}

" colorscheme {{{
colorscheme deep-space
" invert matching paren highlight
hi MatchParen guifg=#c47ebd guibg=#51617d
" }}}

" neomake {{{
let g:neomake_python_enabled_makers = ['pylama']
let g:neomake_python_pylama_maker = {'args': ['--ignore=E501,E203'], }
let g:neomake_python_pylint_maker = {'args': ['--ignore=E501,E203'], }
let g:neomake_open_list = 2

let blacklisted_files = ['.gitlab-ci.yml']
autocmd! BufWritePost,BufEnter * if index(blacklisted_files, expand('%:t')) < 0 | Neomake
call neomake#configure#automake('w')
" }}}

"" coc {{{
" coc.nvim bindings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

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

" nnoremap <silent> <leader>O :<C-u>call CocAction('runCommand', 'editor.action.organizeImport')<CR>

" convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" organize python imports
autocmd FileType python nnoremap <silent> <leader>O :<C-u>CocCommand pyright.organizeimports<cr>

" organize ts/js imports
autocmd FileType typescript,javascript nnoremap <silent> <leader>O :<C-U>CocCommand tsserver.organizeImports<cr> 

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" fix code
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
" }}}

" vim-go {{{
let g:go_def_mapping_enabled = 0
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
" }}}

" misc commands {{{
" set windows to equal size after window resize
" autocmd VimResized * wincmd =

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

" set systax highlight for i3 config file
augroup i3config_ft
    autocmd!
    autocmd BufRead,BufNewFile ~/.config/i3/config set filetype=i3config
augroup END

" run gofmt on save
autocmd BufWritePost *.go silent! !gofmt -w %

"enable polish spellcheck
command! Pol execute ":set spelllang=pl spell"
"enable english spellcheck
command! Eng execute ":set spelllang=en spell"

" save with root privileges
cmap w!! w !sudo tee % >/dev/null

" format rust source file using cargo
command! CargoFmt execute ":silent !cargo fmt"
" }}}

lua << EOF
require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
    },
};
require('session_manager').setup({
  sessions_dir = vim.fn.stdpath('data') .. '/sessions', -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
  autoload_last_session = false, -- Automatically load last session on startup is started without arguments.
  autosave_last_session = false, -- Automatically save last session on exit.
  autosave_ignore_paths = { '~' }, -- Folders to ignore when autosaving a session.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
})
EOF
