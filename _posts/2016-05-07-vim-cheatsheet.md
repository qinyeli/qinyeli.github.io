---
layout: post
title:  "Vim Cheatsheet"
categories: vim cheatsheet
---

# Vim Cheatsheet

## Move
* `h`: left
* `j`: down
* `k`: up
* `l`: right

* `w`: a word forward (to the beginning)
* `2w`: 2 words forward
* `e`: a word forward (to the end)

* `b`: to the beginning of the word
* `O`: to the start of the line
* `^`: to the first non white character of the line
* `$`: to the end of the line
* `g_`: to the last non white character of the line

* `Ctrl + G`: show the location in the text
* `gg`: to the beginning of the file
* `G`: to end of the file
* `2G`: to line 2

* `).`: a sentence forward
* `(`: a sententce backward
* `}`: a paragraph forward
* `{`: a paragraph backward
* `H`: to the top of the window
* `M`: to the middle of the window
* `L`: to the bottom of the window

* `b`: a full screen backword
* `f`: a full screen forward
* `d`: half a screen backford
* `u`: half a screen forward

## Insert
* `i`: insert (before the cursor)
* `I`: insert at the beginning of the line
* `a`: append (after the cursor)
* `A`: append at the end of the line
* `o`: open a line below
* `O`: open a line above

* `<ESC>`: back to normal mode

## Copy, Cut, and Paste
* `x`: delete
* `de`: delete a word
* `dw`: delete a word
* `d$`: delete to end of the line
* `dd`: delete a line
* `y`: yank (copy)
* `yw`: yank a word
* `y$`: yank to the end of the line
* `yy`: yank a line
* `p`: put (paste)

* `u`: undo
* `U`: recover the line
* `Ctrl + R`: redo
* `v`: enter visual mode

## Search and Replac
* `/keyword`: search
	* `n`: next
	* `N`: previous
* `?keyword`: search in the backward direction
* `Ctrl + O`: back to where you were
* `Ctrl + I`: goes forward

* `:s/old/new/g`: substitute globally in the line
* `:%s/old/new/g`: substitute globally in the file
* `:%s/old/new/gc`: substitute globally in the file with prompt

* when searching
	* `:set ic`: ignore case
	* `:set noic`: disable ignore case
	* `:set hls is`: search partical match with highlight
	* `:noh`: remove highlight


## Exit
* `:w`: save
* `:w filename`: save to the file
* `:q`: quit
* `:q!`: quit without saving
* `:wq`: save and quit

## Other
* `%`: find the matching brackets
* `!%`: + external command
* `:r filename`: insert the content of another file (or read the output of an external command)