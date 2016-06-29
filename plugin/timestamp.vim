" =============================================================================
" Author:         scps950707
" Email:          scps950707@gmail.com
" Created:        2016-06-30 00:27
" Last Modified:  2016-06-30 01:16
" Filename:       timestamp.vim
" =============================================================================

if exists('g:loaded_timestamp') || v:version < 700
    finish
endif
let g:loaded_timestamp=1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 UpdateTimeStamp call timestamp#update()

let g:timestampStartLineNum = get (g:,'timestampStartLineNum',1)
let g:timestampEndLineNum = get (g:,'timestampEndLineNum',20)
let g:timestampTimeFormat = get (g:,'timestampTimeFormat','%Y-%m-%d %H:%M')
let g:timestampTimePattern = get (g:,'timestampTimePattern','\(.*\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\)\([0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*\)')

let &cpo = s:save_cpo
unlet s:save_cpo
