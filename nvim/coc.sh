base="coc-json coc-tsserver coc-tabnine coc-yank coc-marketplace coc-vimlsp"  
home="coc-rls coc-vimtex"
work="coc-python coc-go"

extensions="${base} ${home} ${work}"

vim -c "CocInstall -sync ${extensions}|q"

