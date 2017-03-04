" VimShell Setting------------------------------

nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
vnoremap <silent> ,ss :VimShellSendString<CR>
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
