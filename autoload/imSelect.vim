let s:imselectpyfile = expand('<sfile>:r') . '.py'

function! imselect#toggle(mode)
  if !exists("s:imselect_enabled")
    if has('python3')
      let g:imselect_insert_engines_idx = 0
      let g:imselect_normal_engines_idx = 0
      exe 'py3file' s:imselectpyfile
    else
      echohl Error | echo "Can't find Python3 provider." | echohl None
      return ""
    endif
  endif

  if get(s:, 'imselect_enabled', 0) == 1
    let s:imselect_enabled = 0
    echo 'IMSELECT.VIM DISABLE.'

    augroup imselect_vim
      autocmd!
    augroup END
  else
    let s:imselect_enabled = 1
    echo 'IMSELECT.VIM ENABLE.'

    if a:mode == 'i'
      py3 imselectUtil.insert()
    else
      py3 imselectUtil.normal()
    endif

    augroup imselect_vim
      autocmd!
      autocmd InsertEnter * py3 imselectUtil.insert()
      autocmd InsertLeavePre * py3 imselectUtil.normal()
      autocmd CmdlineEnter [/\?] py3 imselectUtil.insert()
      autocmd CmdlineLeave [/\?] py3 imselectUtil.normal()
    augroup END
  endif

  return ""
endfunction

function! imselect#insert_select(offset)
  let g:imselect_insert_engines_idx = (g:imselect_insert_engines_idx + a:offset) % len(g:imselect_insert_engines)
  py3 imselectUtil.insert()
  return ""
endfunction

function! imselect#normal_select(offset)
  let g:imselect_normal_engines_idx = (g:imselect_normal_engines_idx + a:offset) % len(g:imselect_normal_engines)
  py3 imselectUtil.normal()
  return ""
endfunction

