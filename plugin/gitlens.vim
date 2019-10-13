scriptencoding utf-8

if exists('g:loaded_gitlens')
  finish
endif
let g:loaded_gitlens = 1

" sets the value of a variable is not already set by the user
function! s:set(var, default) abort
  " bail if set by user
  if exists(a:var)
    return
  endif

  execute 'let' a:var '=' string(a:default)
endfunction

call s:set('g:gitlens_enabled',                   '0')
call s:set('g:gitlens_virtual_text_prefix',       '')
call s:set('g:gitlens_virtual_text_highlight',    '')
call s:set('g:gitlens_blame_options',             '--minimal --root')
