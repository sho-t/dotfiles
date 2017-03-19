" Vimfiler Setting------------------------------
"unite prefix key.
nnoremap [vimfiler] <Nop>
nmap <Space>f [vimfiler]

let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_ignore_pattern = '^\%(.git\|.DS_Store\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▹'
let g:vimfiler_readonly_file_icon = '⭤'
nnoremap <silent> [vimfiler]e :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> [vimfiler]i :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
 
" vimfiler keymap
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
  
  nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')
  nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')
endfunction
