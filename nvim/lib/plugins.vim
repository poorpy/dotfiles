function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'

  Plug 'roxma/nvim-yarp'
  Plug 'sheerun/vim-polyglot'
  Plug 'mboughaba/i3config.vim'
    
  Plug 'lervag/vimtex'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'cloudhead/neovim-fuzzy'

  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'vim-airline/vim-airline'

  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'tyru/open-browser.vim'
  Plug 'scrooloose/nerdtree'

  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

  Plug 'alx741/vim-stylishask'

  " Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
  " Plug 'guns/vim-sexp'
  " Plug 'tpope/vim-sexp-mappings-for-regular-people'
  " Plug 'jreybert/vimagit'
  " Plug 'w0rp/ale'

  
call plug#end()
