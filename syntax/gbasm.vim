" Vim syntax file
" Language:	Gameboy assembly
" Maintainer: ARM9

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Assembly instructions
syn keyword gbasmInstruction
adc adc add add add and bit call ccf cp cpl daa dec di ei halt inc jp jr ld ldd ldi nop or pop push res ret reti rl rlc rr rrc rst sbc scf set sla sra srl stop sub swap xor xx

adc add and bit ccf cp cpd cpdr cpi cpir cpl daa dec di ei halt im in inc ind ini indr inir jp jr ld ldd lddr ldi ldir neg nop or res rl rla rlc rlca rld rr rra rrc rrca rrd sbc scf set sla sra srl stop sub swap xor

" Instructions changing stack
syn keyword gbasmSpecInst push pop call ret reti retn rst

" Registers
syn keyword gbasmRegister a f af b c bc d e de h l hl sp pc
" Any other stuff
syn match gbasmIdentifier		"\<[a-z_][a-z0-9_]*"

" Labels
syn match gbasmLabel        "\<[a-z_][a-z0-9_]*:"
syn match gbasmSpecialLabel "\<[a-z_][a-z0-9_]*::"

" PreProcessor commands
syn match gbasmPreProc	  "\.org"
syn match gbasmPreProc	  "\.globl"
syn match gbasmPreProc	  "\.db"
syn match gbasmPreProc	  "\.dw"
syn match gbasmPreProc	  "\.ds"
syn match gbasmPreProc	  "\.byte"
syn match gbasmPreProc	  "\.word"
syn match gbasmPreProc	  "\.blkb"
syn match gbasmPreProc	  "\.blkw"
syn match gbasmPreProc	  "\.ascii"
syn match gbasmPreProc	  "\.asciz"
syn match gbasmPreProc	  "\.module"
syn match gbasmPreProc	  "\.title"
syn match gbasmPreProc	  "\.sbttl"
syn match gbasmPreProc	  "\.even"
syn match gbasmPreProc	  "\.odd"
syn match gbasmPreProc	  "\.area"
syn match gbasmPreProc	  "\.page"
syn match gbasmPreProc	  "\.setdp"
syn match gbasmPreProc	  "\.radix"
syn match gbasmInclude	  "\.include"
syn match gbasmPreCondit  "\.if"
syn match gbasmPreCondit  "\.else"
syn match gbasmPreCondit  "\.endif"

" Numbers
syn match gbasmNumericOp    "[#+-*/&|^~<>=!?]"
syn match gbasmNumbers      "\%(\$\x\+\|0x\x\+\|\d\+\|%[01]\+\|0b[01]\+\|0o[0-7]\+\)\>"

" Common strings
syn region gbasmString      start="\"" skip=+\\"+ end="\"\|$"
syn region gbasmString      start="'" skip=+\\'+ end="'\|$"

" Comments
syn match gbasmComment	    ";.*$"

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

  HiLink gbasmIdentifier    Special
  HiLink gbasmLabel		    Label
  HiLink gbasmSpecialLabel	Label
  HiLink gbasmComment		Comment
  HiLink gbasmInstruction	Statement
  HiLink gbasmSpecInst		Statement
  HiLink gbasmRegister      Identifier
  HiLink gbasmInclude		Include
  HiLink gbasmPreCondit		PreCondit
  HiLink gbasmPreProc		PreProc
  HiLink gbasmNumericOp     Number
  HiLink gbasmNumbers		Number
  HiLink gbasmString		String

  delcommand HiLink
endif

let b:current_syntax = "gbasm"
