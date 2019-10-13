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
endfunction
