" Vim syntax file
" Language: Gameboy assembly
" Maintainer: ARM9

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword gbasmTodo    contained todo fixme xxx warning danger note notice bug author date

syn match gbasmNumericOp  "[#+-*/&|^~<>=!?]"
" hex
syn match gbasmNumber "\$\x\+\>"
syn match gbasmNumber "0x\x\+\>"
syn match gbasmNumber "\d\x*h\>"
" dec
syn match gbasmNumber "\d\+\>"
" bin
syn match gbasmNumber "%[01]\+\>"
syn match gbasmNumber "0b[01]\+\>"
syn match gbasmNumber "[01]\+b\>"

" Strings
syn region gbasmString  start="\"" skip=+\\"+ end="\"\|$"
syn region gbasmString  start="'" skip=+\\'+ end="'\|$"

" Comments
syn match gbasmComment  ";.*$" contains=gbasmTodo

" Assembly instructions
syn keyword gbasmInstruction adc add and bit call ccf cp cpl daa dec di ei halt inc jp jr ld ldd ldi nop or pop push res ret reti rl rla rlc rlca rr rra rrc rrca rst sbc scf set sla sra srl stop sub swap xor
syn keyword gbasmCondition nz z nc c

" Registers
syn keyword gbasmRegister a f af b c bc d e de h l hl sp pc
" Any other stuff
syn match gbasmIdentifier "\<\h\w*\>"

" Labels
syn match gbasmLabel      "\<\h\w*::\?"

" PreProcessor commands
syn match gbasmPreProc    "\.org"
syn match gbasmPreProc    "\.globl"
syn match gbasmPreProc    "\.db"
syn match gbasmPreProc    "\.dw"
syn match gbasmPreProc    "\.ds"
syn match gbasmPreProc    "\.byte"
syn match gbasmPreProc    "\.word"
syn match gbasmPreProc    "\.blkb"
syn match gbasmPreProc    "\.blkw"
syn match gbasmPreProc    "\.ascii"
syn match gbasmPreProc    "\.asciz"
syn match gbasmPreProc    "\.module"
syn match gbasmPreProc    "\.title"
syn match gbasmPreProc    "\.sbttl"
syn match gbasmPreProc    "\.even"
syn match gbasmPreProc    "\.odd"
syn match gbasmPreProc    "\.area"
syn match gbasmPreProc    "\.page"
syn match gbasmPreProc    "\.setdp"
syn match gbasmPreProc    "\.radix"
syn match gbasmInclude    "\.include"
syn match gbasmPreCondit  "\.if"
syn match gbasmPreCondit  "\.else"
syn match gbasmPreCondit  "\.endif"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gbasm_syntax_inits")
  if version < 508
    let did_gbasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gbasmNumericOp     Number
  HiLink gbasmNumber        Number

  HiLink gbasmComment       Comment

  HiLink gbasmString        String

  HiLink gbasmIdentifier    Special
  HiLink gbasmLabel         Label

  HiLink gbasmInstruction   Statement
  HiLink gbasmCondition     Statement

  HiLink gbasmRegister      Identifier
  
  HiLink gbasmInclude       Include
  HiLink gbasmPreCondit     PreCondit
  HiLink gbasmPreProc       PreProc

  HiLink gbasmTodo          Todo

  delcommand HiLink
endif

let b:current_syntax = "gbasm"
