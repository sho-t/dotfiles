"=============================================================================
" FILE: fugitive.vim
"=============================================================================

nnoremap [Git] <Nop>
nmap <Space>g [Git]

" git status
nnoremap <silent> [Git]s :<C-u>Gstatus<CR><C-w>T
" git add
nnoremap <silent> [Git]a :<C-u>Gwrite
" git commit
nnoremap <silent> [Git]c :<C-u>Gcommit-v
" git checkout
nnoremap <silent> [Git]r :<C-u>Gread
" git diff
nnoremap <silent> [Git]d :<C-u>Gdiff
" git blame
nnoremap <silent> [Git]b :<C-u>Gblame
" git merge
nnoremap <silent> [fugitive]m :Gmerge<CR>
