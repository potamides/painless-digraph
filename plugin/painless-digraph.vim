"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Plugin: painless-digraph
"    File: plugin/painless-digraph.vim
" Summary: less painful way to input a sequence of digraphs in vim
"  Author: DrCracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !hasmapto('<Plug>PainlessdigraphEnable')
  map <silent> <Leader>de  <Plug>(PainlessdigraphEnable)
endif
if !hasmapto('<Plug>PainlessdigraphToggle')
  map <silent> <Leader>dd  <Plug>(PainlessdigraphDisable)
endif
if !hasmapto('<Plug>PainlessdigraphToggle')
  map <silent> <Leader>dt  <Plug>(PainlessdigraphToggle)
endif

noremap <Plug>(PainlessdigraphEnable)  :call <SID>EnableDigraph()<CR>
noremap <Plug>(PainlessdigraphDisable) :call <SID>DisableDigraph()<CR>
noremap <Plug>(PainlessdigraphToggle)  :call <SID>ToggleDigraph()<CR>

function! s:EnableDigraph()
  augroup painless_digraph
    autocmd!
    autocmd InsertCharPre * call s:CharacterToDigraph()
    autocmd TextChangedI * call s:ResetDigraphBuffer()
    autocmd InsertEnter * let s:digraph = ""
  augroup END
endfunction

function! s:DisableDigraph()
  augroup painless_digraph
    autocmd!
  augroup END
endfunction

function! s:ToggleDigraph()
  if exists('#painless_digraph#InsertEnter')
    call s:DisableDigraph()
  else
    call s:EnableDigraph()
  endif
endfunction

let s:digraph = ""
let s:should_reset = 0
function! s:CharacterToDigraph()
  let s:digraph .= v:char
  if strlen(s:digraph) == 2
    let s:should_reset = 0
    let v:char = s:LookupDigraph(s:digraph)
    let s:digraph = ""
  else
    let v:char = ""
  endif
endfunction

function! s:GetDigraphTable()
	redir => table
    silent digraphs
	redir END
  return split(table, '\_s\+\_d\+\_s\+')
endfunction

let s:digraph_table = s:GetDigraphTable()
function s:LookupDigraph(digraph)
	for entry in s:digraph_table
    let l:split_entry = split(entry)
		if l:split_entry[0] ==# a:digraph
			return l:split_entry[1]
		endif
 	endfor
  return ""
endfunction

function! s:ResetDigraphBuffer()
  if s:should_reset
    let s:digraph = ""
  else 
    let s:should_reset = 1
  endif
endfunction
