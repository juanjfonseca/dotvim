" Define syntax highlighting for the Tera Term macros.
syn region ttlComments start=/\/\*/ end=/\*\//
syn region ttlComments start=/;/ end=/$/

syn keyword ttlKeywords bplusrecv bplussend callmenu changedir clearscreen closett
syn keyword ttlKeywords connect cygconnect disconnect enablekeyb flushrecv gethostname
syn keyword ttlKeywords gettitle kmtfinish kmtget kmtrecv kmtsend loadkeymap
syn keyword ttlKeywords logclose logopen logpause logstart logwrite quickvanrecv
syn keyword ttlKeywords quickvansend recvln restoresetup scprecv scpsend send
syn keyword ttlKeywords sendbreak sendbroadcast sendfile sendkcode sendln sendlnbroadcast
syn keyword ttlKeywords sendmulticast setbaud setdebug setdtr setecho setmulticastname
syn keyword ttlKeywords setrts setsync settitle showtt testlink unlink
syn keyword ttlKeywords wait wait4all waitevent waitln waitn waitrecv
syn keyword ttlKeywords waitregex xmodemrecv xmodemsend zmodemrecv zmodemsend break
syn keyword ttlKeywords call do loop end execcmnd exit for next
syn keyword ttlKeywords goto if then elseif else endif include mpause pause return
syn keyword ttlKeywords until enduntil while endwhile code2str int2str sprintf sprintf2
syn keyword ttlKeywords str2code str2int strcompare strconcat strcopy strlen
syn keyword ttlKeywords strmatch strscan tolower toupper fileclose fileconcat
syn keyword ttlKeywords filecopy filecreate filedelete filemarkptr fileopen filereadln
syn keyword ttlKeywords fileread filerename filesearch fileseek fileseekback filestrseek
syn keyword ttlKeywords filestrseek2 filewrite filewriteln findfirst findnext findclose getdir makepath
syn keyword ttlKeywords setdir delpassword getpassword passwordbox beep closesbox
syn keyword ttlKeywords clipb2var crc32 crc32file exec filenamebox getdate
syn keyword ttlKeywords getenv gettime getttdir getver ifdefined inputbox
syn keyword ttlKeywords messagebox random rotateleft rotateright setdate setdlgpos
syn keyword ttlKeywords setenv setexitcode settime show statusbox var2clipb
syn keyword ttlKeywords yesnobox

" syn keyword ttlLables

" Link to the default color for each element to match the
" selected color scheme.
hi def link ttlComments  Comment
hi def link ttlKeywords  Keyword
" hi def link ttlLabels    Label
