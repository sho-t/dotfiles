" ColorScheme Setting--------------------------
syntax enable
set background=dark
" Use True Color
set termguicolors
" Use italic
let g:solarized_term_italics = 1
" Solarized Dark
colorscheme solarized8

" LightLine Setting-----------------------------
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': "MyFugitive",
      \   'readonly': "MyReadonly",
      \   'modified': "MyModified",
      \   'filename': "MyFilename",
      \   'ale': "MyAleStatus"
      \ },
      \ 'separator': { 'left': "\uE0b0", 'right': "\uE0b2" },
      \ 'subseparator': { 'left': "\uE0b1", 'right': "\uE0b3" }
      \ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "\u2b64"
    else
        return ""
    endif
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? "\u2b60 ".branch : ''
    endif
    return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
