# painless-digraph
*painless-digraph* provides you with a less painful way to input a sequence of
digraphs in vim.

## Intro

Vim digraphs provide a useful mechanism to enter special characters normally
not found on a keyboard. But since the methods to enter digraphs require
additional keypresses, it becomes tedious to input sequences or short phrases
(e.g. in hiragana, katakana or greek).
The *painless-digraph* plugin relieves you from this pain and provides a
digraph-mode which allows you to enter digraphs directly, without additional
keypresses.

## Installation

You can install this plugin using any vim plugin manager by using the path on
GitHub for this repository. For
[vim-plug](https://github.com/junegunn/vim-plug) just add the following:

```vim
Plug 'DrCracket/painless-digraph'
```

## Mappings

### Internal Mappings

#### \<Plug\>(PainlessdigraphEnable)

This internal mapping enables the painless-digraph functionality. After calling
this mapping you can e.g. write `kon5nitiwa` to get the hiragana `こんにちわ`.

#### \<Plug\>(PainlessdigraphDisable)

Disables the painless-digraph digraph-mode.

#### \<Plug\>(PainlessdigraphToggle)

Toggles the painless-digraph digraph-mode.

### Default Mappings

The default mappings of this plugin are as follows: 
```vim
  map <silent> <Leader>de  <Plug>(PainlessdigraphEnable)
  map <silent> <Leader>dd  <Plug>(PainlessdigraphDisable)
  map <silent> <Leader>dt  <Plug>(PainlessdigraphToggle)
```
To change them just put your desired mappings in your *vimrc*.
