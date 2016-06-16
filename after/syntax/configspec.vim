" Define syntax highlighting for the ClearCase Config Spec.
syn region ccComments start=/#/ end=/$/
syn keyword ccKeywords mkbranch none element include 
syn keyword ccLables CHECKEDOUT LATEST

" hi ccComments  guifg=red
" hi ccKeywords  guifg=green
" hi ccLabels    guifg=blue

hi def link ccComments  Comment
hi def link ccKeywords  Keyword
hi def link ccLabels    Label
