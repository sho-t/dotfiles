" ale Setting---------------------------------
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint']
      \ }

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
