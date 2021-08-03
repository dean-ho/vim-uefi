" Vim syntax file
" Language:     UEFI VFR
" Maintainer:   Paul Huang, Dean Ho
" Last Change:  2021 Aug 3

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"unlet b:current_syntax

syn case        match
syn region      vfrIncluded       display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match       vfrIncluded       display contained "<[^>]*>"
syn match       vfrInclude        display "^\s*\zs\(%:\|#\)\s*include\>\s*["<]" contains=vfrIncluded
syn cluster     vfrPreProcGroup   contains=vfrPreCondit,vfrIncluded,vfrInclude,vfrDefine,vfrSpecial,vfrNumber,vfrString,vfrCommentSkip,vfrParen
syn region      vfrDefine         start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@vfrPreProcGroup,@Spell
syn region      vfrPreProc        start="^\s*\zs\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@vfrPreProcGroup,@Spell
syn region      vfrPreCondit      start="^\s*\zs\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=vfrComment,vfrCommentL,vfrString
syn match       vfrPreConditMatch display "^\s*\zs\(%:\|#\)\s*\(else\|endif\)\>"
syn keyword     vfrDataStruct     typedef struct UINT64 UINT32 UINT16 UINT8 BOOLEAN EFI_STRING_ID EFI_HII_DATE EFI_HII_TIME EFI_HII_REF
syn keyword     vfrFormSet        NON_DEVICE DISK_DEVICE VIDEO_DEVICE NETWORK_DEVICE INPUT_DEVICE ONBOARD_DEVICE OTHER_DEVICE SETUP_APPLICATION GENERAL_APPLICATION FRONT_PAGE SINGLE_USE
syn keyword     vfrStore          defaultstore varstore efivarstore namevaluevarstore
syn keyword     vfrStr            STRING_TOKEN
syn match       vfrSpecial        display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region      vfrString         start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn keyword     vfrQuestionHeader questionid
syn keyword     vfrConstant       TRUE FALSE ONE ONES ZERO UNDEFINED VERSION
syn keyword     vfrImageLockedTag image IMAGE_TOKEN locked
syn keyword     vfrStatement      formset endformset form endform formmap rule endrule subtitle endsubtitle goto resetbutton endresetbutton inconsistentif disableif nosubmitif warningif timeout suppressif grayoutif endif checkbox endcheckbox action endaction numeric endnumeric oneof endoneof string endstring password endpassword orderedlist endlist date enddate time endtime label banner line align timeout guidop endguidop data
syn match       vfrStatement      "text$"
syn keyword     vfrAttribute      guid title help classguid class subclass prompt attribute varid name for mid maptitle mapguid flags key  devicePath formsetguid formid question refresh interval varstoredevice refreshguid default value option read write config minimum maximum step minsize maxsize year month day hour minute second left center right datatype
syn match       vfrAttribute      "text\s\+="
syn keyword     vfrConstant       READ_ONLY INTERACTIVE RESET_REQUIRED OPTIONS_ONLY HORIZONTAL OPTION_DEFAULT OPTION_DEFAULT_MFG INTERACTIVE RESET_REQUIRED DEFAULT CHECKBOX_DEFAULT CHECKBOX_DEFAULT_MFG NUMERIC_SIZE_1 NUMERIC_SIZE_2 NUMERIC_SIZE_4 NUMERIC_SIZE_8 DISPLAY_INT_DEC DISPLAY_UINT_DEC DISPLAY_UINT_HEX MULTI_LINE UNIQUE NOEMPTY YEAR_SUPPRESS MONTH_SUPPRESS DAY_SUPPRESS STORAGE_NORMAL STORAGE_TIME STORAGE_WAKEUP HOUR_SUPPRESS MINUTE_SUPPRESS SECOND_SUPPRESS STORAGE_NORMAL STORAGE_TIME STORAGE_WAKEUP SENSITIVE INSENSITIVE LAST_NON_MATCH FIRST_NON_MATCH
syn keyword     vfrOperator       OR AND NOT catenatev match dup ideqval ideqid ideqvallist questionref ruleref stringref pushthis security get length questionrefval stringrefval boolval stringval format unintval toupper tolower set cond find mid token span map match2
syn match       vfrOperator       "[|&=!<>*/%~+-]"
syn match       vfrCommentSkip    contained "^\s*\*\($\|\s\+\)"
syn region      vfrCommentL       start="//" skip="\\$" end="$" keepend contains=vfrComment2String,@Spell
syn region      vfrComment        start="/\*" end="\*/" extend contains=vfrComment2String,@Spell
syn region      vfrCommentString  contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=vfrSpecial,vfrCommentSkip
syn region      vfrComment2String contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=vfrSpecial
syn match       vfrNumbers        display transparent "\<\d\|\.\d" contains=vfrNumber
syn match       vfrNumber         "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match       vfrNumber         display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"


" Comment
hi def link vfrCommentL           vfrComment
hi def link vfrComment            Comment
" Constant - String Character Number Boolean Float
hi def link vfrConstant           Constant
hi def link vfrString             String
hi def link vfrNumbers            Number
hi def link vfrNumber             Number
hi def link vfrIncluded           vfrString
hi def link vfrCommentString      vfrString
hi def link vfrComment2String     vfrString
" Identifier - Function
" Statement - Conditional Repeat Label Operator Keyword Exception
hi def link vfrStatement          Statement
hi def link vfrStore              Statement
hi def link vfrOperator           Operator
hi def link vfrAttribute          Keyword
hi def link vfrFormSet            Keyword
hi def link vfrStr                Keyword
hi def link vfrQuestionHeader     Keyword
hi def link vfrImageLockedTag     Keyword
" PreProc - Include Define Macro PreCondit
hi def link vfrInclude            Include
hi def link vfrPreProc            PreProc
hi def link vfrDefine             Macro
hi def link vfrPreConditMatch     vfrPreCondit
hi def link vfrPreCondit          PreCondit
" Type - StorageClass Structure Typedef
hi def link vfrDataStruct         Type
" Special - SpecialChar Tag Delimiter SpecialComment Debug
hi def link vfrSpecial            SpecialChar
" Underlined
" Ignore
" Error
" Todo




let b:current_syntax = "uefivfr"

" vim:ts=8:foldmethod=marker
