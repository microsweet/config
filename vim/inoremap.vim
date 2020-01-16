"markdown
autocmd Filetype markdown inoremap <buffer> ,a ---
autocmd Filetype markdown inoremap <buffer> ,f <++>

"html
"autocmd Filetype html inoremap <buffer> ,f <++>
autocmd Filetype html nnoremap mm I<!-- <ESC>A --><ESC>

"js
autocmd Filetype javascript nnoremap mm 0i// <ESC>

"python
autocmd Filetype python inoremap # # 
autocmd Filetype python nnoremap mm 0i# <ESC>

"vim
autocmd Filetype vim inoremap " " 
