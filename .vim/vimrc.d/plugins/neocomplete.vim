" Neocomplete Setting---------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#enable_quick_match = 1

let g:neocomplete#max_list = 50
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1

let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete_enable_fuzzy_completion_start_length = 2
let g:neocomplete_enable_camel_case_completion = 0
let g:neocomplete#enable_auto_delimiter = 1

" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
augroup my_neocomplete_conf
  autocmd!
  autocmd insertleave * silent! pclose!
augroup end

highlight Pmenu ctermbg=6
highlight PmenuSel ctermbg=3
highlight PMenuSbar ctermbg=0
"inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : “<CR>”

let g:neocomplete#max_keyword_width = 10000

if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.ruby = ['::']

if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'


if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

let s:neco_dicts_dir = $HOME . '/dicts'
if isdirectory(s:neco_dicts_dir)
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'ruby': s:neco_dicts_dir . '/ruby.dict',
  \   'javascript': s:neco_dicts_dir . '/jquery.dict',
  \ }
endif
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'
