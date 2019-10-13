scriptencoding utf-8
" virtualtext manipulation in nvim


" gets the namespace that we're using for gitlens. If this workspace does not
" exist, creates it.
function! s:get_namespace() abort
  let ns_name = 'plugin-gitlens'

  if !exists('s:namespace')
    let s:namespace = nvim_create_namespace(ns_name)
  endif

  return s:namespace
endfunction


" writes the given text to the virtualtext in the gitlens namespace
function! gitlens#virtualtext#write(buffer_number, line_number, message, highlight) abort
  call nvim_buf_set_virtual_text(a:buffer_number,
        \ s:get_namespace(),
        \ a:line_number - 1,
        \ [[a:message, a:highlight]],
        \ {})
endfunction


" clears all the virtualtext from the gitlens namespace
function! gitlens#virtualtext#clear(buffer_number) abort
  call nvim_buf_clear_namespace(a:buffer_number, s:get_namespace(), 0, -1)
endfunction
