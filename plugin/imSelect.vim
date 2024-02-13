scriptencoding utf-8

if &cp || exists("g:loaded_imSelect")
  finish
endif

let g:loaded_imSelect = 1

inoremap <silent> <Plug>ImSelectToggle <C-R>=imselect#toggle('i')<CR>
nnoremap <silent> <Plug>ImSelectToggle :<C-U>call imselect#toggle('n')<CR>
inoremap <silent> <Plug>ImSelectEngineNext <C-R>=imselect#insert_select(1)<CR>
nnoremap <silent> <Plug>ImSelectEngineNext :<C-U>call imselect#normal_select(1)<CR>
inoremap <silent> <Plug>ImSelectEnginePrev <C-R>=imselect#insert_select(-1)<CR>
nnoremap <silent> <Plug>ImSelectEnginePrev :<C-U>call imselect#normal_select(-1)<CR>

if !exists("g:imselect_no_mappings") || ! g:ibus_no_mappings
  imap <C-A-I><C-A-I> <Plug>ImSelectToggle
  nmap <C-A-I><C-A-I> <Plug>ImSelectToggle
  imap <C-A-I><C-A-P> <Plug>ImSelectEngineNext
  nmap <C-A-I><C-A-P> <Plug>ImSelectEngineNext
  imap <C-A-I><C-A-O> <Plug>ImSelectEnginePrev
  nmap <C-A-I><C-A-O> <Plug>ImSelectEnginePrev
endif
