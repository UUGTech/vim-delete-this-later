# Delete this later!

## Summary
In a c++ file, you can mark areas that you want to delete instantly later and easily delete them.
This plugin is made by a vim newbie and is under development. Please give me advice and contributions.

## Introduction

You need to set keymap for `<Plug>(delete_this_later_insert)` and `<Plug>(insert_this_later_delete)`.

sample:
``` viml:init.vim
nmap <C-d><C-i> <Plug>(delete_this_later_insert)
nmap <C-d><C-d> <Plug>(delete_this_later_delete)
```

## How to use
By using `<Plug>(delete_this_later_insert)`, you can insert "begin tag" and "end tag".

By using `<Plug>(delete_this_later_delete)`, you can delete sections that begins with a "begin tag" and ends with a "end tag".

**For competitive programmer using vim on WSL**, you can use `:Clp` command to copy the contents of the file to the clipboard after deletion of the sections specified by the tags.

