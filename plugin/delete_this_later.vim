scriptencoding utf-8
if exists('g:loaded_delete_this_later')
    finish
endif
let g:loaded_delete_this_later = 1

let s:save_cpo = &cpo
set cpo&vim

:command! -nargs=0 DeleteThisLaterTagHilight call DeleteTagHilight()
:command! -nargs=0 DeleteThisLaterDelete call DeleteThisLaterDelete()
:command! -nargs=0 Clp call CopyToClipWithDelete()

autocmd BufNew,BufRead *.cpp call delete_this_later#DeleteTagHilight()
nnoremap <silent> <Plug>(delete_this_later_insert) :call delete_this_later#InsertDebugPart()<CR>
nnoremap <silent> <Plug>(delete_this_later_delete) :call delete_this_later#DeleteThisLaterDelete()<CR>


let &cpo = s:save_cpo
unlet s:save_cpo

