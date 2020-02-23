let s:my_config_dir = expand('<sfile>:p:h')
let mapleader = "\<Space>"
map <Space> <leader>

for s:path in globpath(s:my_config_dir.'/lib', '*', 0, 1) 
  if s:path =~# '.vim$'
    execute 'source' fnameescape(s:path)
  endif
endfor

for s:path in globpath(s:my_config_dir.'/lib/lang', '*', 0, 1)
  execute 'source' fnameescape(s:path)
endfor

for s:path in globpath(s:my_config_dir.'/lib/plug', '*', 0, 1)
  execute 'source' fnameescape(s:path)
endfor

set termguicolors
set background=dark
set encoding=utf-8
" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
colorscheme deep-space

" augroup tex_ft
"     au!
"     au BufRead,BufNewFile *.tex set syntax=tex
" augroup END
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
