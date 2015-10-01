" Auto-reload `.vimrc` on edit.

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost .vimrc,.nvimrc source $MYVIMRC
augroup END " }
