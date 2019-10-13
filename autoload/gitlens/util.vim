scriptencoding utf-8
" utils for git lens

function! gitlens#util#get_message_from_blame(blame) abort
  " handle case when no blame or blame fails
  if a:blame =~# 'fatal: ' || a:blame ==# ''
    return
  endif

  let temp = split(a:blame, '(')
  let commit = temp[0]

  " handle case when not committed
  if commit =~# '0000000'
    return 'Not committed yet'
  endif

  let temp = temp[1]
  let temp = split(temp, ')')[0]
  let commit_author = join(split(temp, ' ')[:-5], ' ')

  return commit_author . ' | ' . commit
endfunction
