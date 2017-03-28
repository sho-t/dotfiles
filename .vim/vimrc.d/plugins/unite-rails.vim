"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer> [unite]rc        :<C-u>Unite rails/controller<CR>
  nnoremap <buffer> [unite]rm        :<C-u>Unite rails/model<CR>
  nnoremap <buffer> [unite]rv        :<C-u>Unite rails/view<CR>

  nnoremap <buffer> [unite]ro        :<C-U>Unite rails/config<CR>
  nnoremap <buffer> [unite]rs        :<C-U>Unite rails/spec<CR>
  nnoremap <buffer> [unite]rm        :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer> [unite]rl        :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr> [unite]rg  ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr> [unite]rr  ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr> [unite]rs  ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer> [unite]ra        :<C-U>Unite rails/rake<CR>

endfunction
aug unite_rails_cmd
  autocmd!
  autocmd User Rails call UniteRailsSetting()
aug END
"}}}
