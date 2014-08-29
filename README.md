Syntax highlighting for Gameboy assembly, for the vim text editor.

### Installing
Put the .vim file in /syntax into ~/.vim/syntax
##### or with Pathogen
Clone this repo into your ~/.vim/bundle directory.

### Using
In your .vimrc:
```
au BufNewFile,BufRead *.FTODO set filetype=TODO
```
and/or put this line near the top or bottom of your assembly file(s):
```
@ vim: ft=TODO
```
or run inside vim:
```
:setf TODO
```

