"=============================================================================
" FILE: dein.vim
"=============================================================================

nnoremap [denite] <Nop>
nmap <Space>u [denite]

" ctrlp
nnoremap <silent> <C-p>     :<C-u>Denite file_rec<CR>
" grep
nnoremap <silent> [denite]/ :<C-u>Denite -buffer-name=search -mode=normal grep<CR>
" file
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir -buffer-name=files file<CR>
" word
nnoremap <silent> [denite]8 :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" line
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
" file mru
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
" dirmrulist
nnoremap <silent> [denite]d :<C-u>Denite directory_rec<CR>

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif

call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')
" tabopen
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
" sprit
call denite#custom#map('insert', "<C-s>", '<denite:do_action:split>')
call denite#custom#map('normal', "s", '<denite:do_action:split>')
" vsprit
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" customize ignore globs
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [
      \ '.git/', 'build/', '__pycache__/',
      \ 'images/', '*.o', '*.make',
      \ '*.min.*',
      \ 'img/', 'fonts/'])
