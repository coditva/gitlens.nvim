
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

  execute 'let' a:var '=' a:default
endfunction
