scriptencoding utf-8
" functions which interact with git cli

function! gitlens#git#blame(file_name, line_number, options) abort
  return system('git blame ' . a:options . ' ' .
        \ '-L ' . a:line_number . ',' . a:line_number .  ' ' .
        \ a:file_name)
endfunction
