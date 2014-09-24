Syntax highlighting for Gameboy assembly, for the vim text editor.

### Installing
Copy /syntax into ~/.vim
__or with Pathogen__
Clone this repo into your ~/.vim/bundle directory.
```
git clone https://github.com/ARM9/gb-syntax-vim.git
```

### Using
In your .vimrc:
```
au BufNewFile,BufRead *.asm,*.inc set filetype=gbasm
```
and/or put this line near the top or bottom of your assembly file(s):
```
; vim: ft=gbasm
```

