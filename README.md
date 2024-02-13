# imSelect.vim

Change input engine automatically when switch between normal and insert mode.

## Configuration

```vim
let g:imselect_insert_engines = [ '-534772732', '67372036' ]
let g:imselect_normal_engines = [ '67699721' ]
let g:imselect_no_mappings = 1
```

`g:imselect_insert_engines` are used when switch to insert mode.
`g:imselect_no_mappings = 1` disable default key mapping.

## Default Key Mapping

Toggle imSelect.vim on/off.

```vim
imap <C-A-I><C-A-I> <Plug>ImSelectToggle
nmap <C-A-I><C-A-I> <Plug>ImSelectToggle
```

Switch to next input engine.

```vim
imap <C-A-I><C-A-P> <Plug>ImSelectEngineNext
nmap <C-A-I><C-A-P> <Plug>ImSelectEngineNext
```

Switch to previous input engine.

```vim
imap <C-A-I><C-A-O> <Plug>ImSelectEnginePrev
nmap <C-A-I><C-A-O> <Plug>ImSelectEnginePrev
```

## How to find keyboard layout ID

```bash
pip install pywin32
```

```python
import win32api
im_list = win32api.GetKeyboardLayoutList()
print(im_list)
```
