scriptencoding utf-8

if &cp || exists("g:loaded_imSelect")
  finish
endif

let g:loaded_imSelect = 1

inoremap <silent> <Plug>imSelectToggle <C-R>=imselect#toggle('i')<CR>
nnoremap <silent> <Plug>imSelectToggle :<C-U>call imselect#toggle('n')<CR>
inoremap <silent> <Plug>imSelectEngineNext <C-R>=imselect#insert_select(1)<CR>
nnoremap <silent> <Plug>imSelectEngineNext :<C-U>call imselect#normal_select(1)<CR>
inoremap <silent> <Plug>imSelectEnginePrev <C-R>=imselect#insert_select(-1)<CR>
nnoremap <silent> <Plug>imSelectEnginePrev :<C-U>call imselect#normal_select(-1)<CR>

if !exists("g:imselect_no_mappings") || ! g:ibus_no_mappings
  imap <C-B><C-B> <Plug>imSelectToggle
  nmap <C-B><C-B> <Plug>imSelectToggle
  imap <C-B><C-]> <Plug>imSelectEngineNext
  nmap <C-B><C-]> <Plug>imSelectEngineNext
  imap <C-B><C-[> <Plug>imSelectEnginePrev
  nmap <C-B><C-[> <Plug>imSelectEnginePrev
endif
