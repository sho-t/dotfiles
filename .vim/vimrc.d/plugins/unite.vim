" Unite Setting---------------------------------
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>u [unite]

let g:unite_source_file_mru_filename_format=''
let g:unite_enable_start_insert=0

let g:unite_source_bookmark_directory = $HOME . '/.vim/.unite/bookmark'
 
" Grepping using <space>/
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<CR>
" filelist
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" bufferlist
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" registerlist
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" mrulist
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" dirmrulist
nnoremap <silent> [unite]d :<C-u>Unite directory_mru<CR>
" yankhistory
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" bookmarklist
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" add bookmark
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "split
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "vimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

