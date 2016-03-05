nnoremap <Space> :Unite -start-insert -toggle -auto-resize file file_rec/async file_mru<CR>
nnoremap <Leader><Space> :Unite -start-insert -toggle -auto-resize<CR>

" Unite {{{ "
" Fuzzy match by default
" Stolen from 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])


" Keep track of yanks
let g:unite_source_history_yank_enable = 1
" Prettier prompt
call unite#custom#profile('default', 'context', {
    \   'prompt': '» ',
    \   'start_insert': 1,
    \   'update_time': 200,
    \   'cursor_line_highlight': 'UniteSelectedLine',
    \   'direction': 'botright',
    \   'prompt_direction': 'top',
    \ })
" Autosave sessions for unite-sessions
let g:unite_source_session_enable_auto_save = 1
" Non-ugly colors for selected item, requires you to set 'hi UnitedSelectedLine'
let g:unite_cursor_line_highlight = "UniteSelectedLine"
" Set to some better time formats
let g:unite_source_buffer_time_format = "%Y-%m-%d  %H:%M:%S  "
let g:unite_source_file_mru_time_format = "%Y-%m-%d  %H:%M:%S  "

" Use ag or ack as grep command if possible
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
              \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

" }}} Unite "
