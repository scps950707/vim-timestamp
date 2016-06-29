" =============================================================================
" Author:         scps950707
" Email:          scps950707@gmail.com
" Created:        2016-06-30 00:27
" Last Modified:  2016-06-30 00:27
" Filename:       timestamp.vim
" =============================================================================

if exists('g:loaded_timestamp') || v:version < 700
    finish
endif
let g:loaded_timestamp=1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 UpdateTimeStamp call timestamp#update()

let &cpo = s:save_cpo
unlet s:save_cpo
