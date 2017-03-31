"------------------------------------
" vim-rails
"------------------------------------
""{{{
"vim-rails prefix key.
nnoremap [rails] <Nop>
nmap <Space>r [rails]

let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer>[rails]r :R<CR>
  nnoremap <buffer>[rails]a :A<CR>
  nnoremap <buffer>[rails]m :Rmodel<Space>
  nnoremap <buffer>[rails]c :Rcontroller<Space>
  nnoremap <buffer>[rails]v :Rview<Space>
  nnoremap <buffer>[rails]p :Rpreview<CR>
endfunction

aug vim_rails_cmd
  au!
  au User Rails call SetUpRailsSetting()
aug END

"}}}
