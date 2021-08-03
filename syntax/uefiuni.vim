" Vim syntax file
" Language:     UEFI UNI
" Maintainer:   Paul Huang, Dean Ho
" Last Change:  2021 Aug 3

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"unlet b:current_syntax

syn case    match
syn match   uniKeyword      "#\(font\|fontdef\|string\|langdef\|language\)"
syn region  uniString       start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn match   uniSpecial      display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region  uniCommentL     start="//" skip="\\$" end="$" keepend contains=uniComment2String,@Spell
syn region  uniComment      start="/\*" end="\*/" extend contains=uniComment2String,@Spell
syn region  uniCommentString contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=uniSpecial,uniCommentSkip
syn region  uniComment2String contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=uniSpecial


" Comment
hi def link uniCommentL         uniComment
hi def link uniComment          Comment
" Constant - String Character Number Boolean Float
hi def link uniString           String
hi def link uniCommentString    uniString
hi def link uniComment2String   uniString
" Identifier - Function
" Statement - Conditional Repeat Label Operator Keyword Exception
hi def link uniKeyword          Statement
" PreProc - Include Define Macro PreCondit
" Type - StorageClass Structure Typedef
" Special - SpecialChar Tag Delimiter SpecialComment Debug
hi def link uniSpecial          SpecialChar
" Underlined
" Ignore
" Error
" Todo




let b:current_syntax = "uefiuni"

" vim:ts=8:foldmethod=marker
