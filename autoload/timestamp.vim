" =============================================================================
" Author:         scps950707
" Email:          scps950707@gmail.com
" Created:        2016-06-29 23:35
" Last Modified:  2016-06-30 01:16
" Filename:       timestamp.vim
" =============================================================================
" auto-update the timestamp right before saving a file
" The Timestamp format is : 2016-06-10 16:09
" Within the 20 first lines, the matched lines are :
" Last [Cc]hange(d)
" Changed
" Last [Mm]odified
" Modified
" Last [Uu]pdate(d)

let s:save_cpo = &cpo
set cpo&vim

function! timestamp#update()
    let pattern = g:timestampTimePattern
    let replace = '\1' . strftime(g:timestampTimeFormat)
    call timestamp#substitute(g:timestampStartLineNum, g:timestampEndLineNum, pattern, replace)
endfunction

function! timestamp#substitute(start, end, pattern, replace)
    let lineno = a:start
    while lineno <= a:end
        let curline = getline(lineno)
        if match(curline, a:pattern) != -1
            let newline = substitute( curline, a:pattern, a:replace, '' )
            if( newline != curline )
                keepjumps call setline(lineno, newline)
            endif
        endif
        let lineno = lineno + 1
    endwhile
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
