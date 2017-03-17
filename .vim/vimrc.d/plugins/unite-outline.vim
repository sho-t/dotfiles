" Unite-outline Setting---------------------------------

let g:unite_split_rule = 'botright'
nnoremap <silent> [unite]o <ESC>:Unite -vertical -winwidth=40 outline<CR>

" unite-outline auto_update
let g:unite_source_outline_filetype_options = {
      \ '*': {
      \   'auto_update': 1,
      \   'auto_update_event': 'write',
      \ },
      \ 'cpp': {
      \   'ignore_types': ['enum', 'typedef', 'macro'],
      \ },
      \ 'javascript': {
      \   'ignore_types': ['comment'],
      \ },
      \ 'markdown': {
      \   'auto_update_event': 'hold',
      \ },
      \}
