autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd VimResized * wincmd =

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

augroup i3config_ft
    autocmd!
    autocmd BufRead,BufNewFile ~/.config/i3/config set filetype=i3config
augroup END

command! Pol execute ":set spelllang=pl spell"
command! Ang execute ":set spelllang=en spell"

command! CargoFmt execute ":silent !cargo fmt"

cmap w!! w !sudo tee % >/dev/null

au FileType python command! Run execute ":silent !python % &"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
