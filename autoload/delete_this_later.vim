let s:save_cpo = &cpo
set cpo&vim

:command! -nargs=0 DeleteThisLaterInsert call InsertDebugPart()

func! delete_this_later#InsertDebugPart()
    let pos = getpos('.')
    let line = pos[1]
    let indent = indent('.')
    let space = ""
    for i in range(indent)
        let space = space . ' '
    endfor
    let begin_word = space . "// - DeleteThisLater Begin -"
    let end_word = space . "// - DeleteThisLater End -"
    call append(line, begin_word)
    call append(line+1, space)
    call append(line+2, end_word)
    :startinsert
    let pos[1] += 2
    let pos[2] = indent+1
    call setpos('.', pos)
endf

func! delete_this_later#DeleteTagHilight()
    syn match deleteTag "\(// - DeleteThisLater \(Begin\|End\) -\)"
    hi deleteTag ctermbg=208 ctermfg=15 guibg=#FF3366 guifg=#FFFFFF
endf

func! delete_this_later#DeleteThisLaterDelete()
    if search("// - DeleteThisLater Begin -")
        %s/\/\/ - DeleteThisLater Begin -\(\n\|.\)\{-}\/\/ - DeleteThisLater End -/
    endif
endf

func! CopyToClipWithDelete()
    call delete_this_later#DeleteThisLaterDelete()
    :w
    let file = expand("%:p")
    call system("clip.exe < ".file)
endf


let &cpo = s:save_cpo
unlet s:save_cpo

