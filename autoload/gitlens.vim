scriptencoding utf-8
" the api for the git lens

function! gitlens#enable() abort
endfunction

function! gitlens#disable() abort
endfunction

function! gitlens#refresh() abort
  " we don't use use gitlens when the buffer is modified because I don't know
  " how to handle it ¯\_(ツ)_/¯
  if &modified
    return
  endif

  let buffer_number = bufnr()
  let buffer_name = bufname(buffer_number)

  " handle the case when no file
  if buffer_name ==# ''
    return
  endif

  let line_number = getcurpos()[1]

  let blame = gitlens#git#blame(buffer_name, line_number, g:gitlens_blame_options)
  let message = gitlens#util#get_message_from_blame(blame)
  if message ==# ''
    return
  endif

  call gitlens#virtualtext#clear(buffer_number)
  call gitlens#virtualtext#write(buffer_number, line_number,
        \ g:gitlens_virtual_text_prefix . message,
        \ g:gitlens_virtual_text_highlight)

endfunction
