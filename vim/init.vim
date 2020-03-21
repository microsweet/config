syntax on
let mapleader=" "
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
"set expandtab
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
set backspace=indent,eol,start
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set scrolloff=10

" edit <++>
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>d4li

noremap S :w<CR>
noremap ; :
noremap sv :set splitright<CR>:vsplit<CR>
noremap sou :source $MYVIMRC<CR>
noremap tb :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap nd : NERDTreeToggle<CR>
noremap nf : NERDTreeFind<CR>
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>jj <C-w>j
noremap <LEADER>kk <C-w>k
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap > >>
noremap < <<
noremap res :res 
noremap vres :vertical res 

"inoremap { {}<ESC>i<CR><ESC>O
inoremap { {}<ESC>i

"### copy to system clipboard
vnoremap Y "+y

" autocmd
autocmd BufRead,BufNewFile *.py setlocal ts=4 sts=4 sw=4 et
autocmd BufRead,BufNewFile *.html setlocal ts=4 sts=4 sw=4 et
autocmd BufRead,BufNewFile *.js setlocal ts=2 sts=2 sw=2 et


" ##############################
" #
" # install plug with plug
" #
" ##############################

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
" snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" color
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'mzlogin/vim-markdown-toc'
" 配色主题
Plug 'morhetz/gruvbox'
" 代码高亮
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 注释(<leader>c<spacd>; <leader>c$)
Plug 'scrooloose/nerdcommenter'
" 代码折叠(zo zO zc zC)
Plug 'tmhedberg/SimpylFold'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python'}

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()



" ##############################
" #
" # indentLine
" #
" ##############################

let g:indentLine_char = '│'
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig
let g:indentLine_fileTypeExclude = ['tex']

"markdown
source ~/.config/nvim/inoremap.vim
noremap <LEADER>m :TableModeToggle<CR>



" ##############################
" #
" # Create a _machine_specific.vim file to adjust machine specific stuff, 
" # like python interpreter location
" #
" ##############################

let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim



" ##############################
" #
" # coc
" #
" ##############################

let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-gitignore', 'coc-go', 'coc-omnisharp', 'coc-java']
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap fmt :call CocAction('format')<CR>
" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ##############################
" #
" # Ultisnips
" # need pip install neovim --upgrade
" #
" ##############################

inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


" ##############################
" #
" # NERDTree
" #
" ##############################

" 关闭NERDTree快捷键
"map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
"let NERDTreeShowHidden=1
" 设置宽度
"let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 自动选中节点
let g:nerdtree_tabs_autofind=0


" ##############################
" #
" # NERDTree-git
" #
" ##############################

let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
		    	\ "Untracked" : "✭",
		    	\ "Renamed"   : "➜",
		    	\ "Unmerged"  : "═",
		    	\ "Deleted"   : "✖",
		    	\ "Dirty"     : "✗",
		    	\ "Clean"     : "✔︎",
		    	\ 'Ignored'   : '☒',
		    	\ "Unknown"   : "?"
			\}


" ##############################
" #
" # MarkdownPreview
" #
" ##############################

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browser = '/usr/bin/chromium'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'



" ##############################
" #
" # Compile function
" #
" ##############################

map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    "set splitright
    :sp
    :term python3 %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc


" ##############################
" #
" # auto fcitx
" #
" ##############################

let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
"autocmd InsertEnter * call Fcitx2zh()

" ##############################
" #
" # vim-go
" #
" ##############################

let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0



" ##############################
" #
" # FZF
" #
" ##############################

noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :LinesWithPreview<CR>
noremap <C-w> :Buffers<CR>
noremap q; :History:<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)


command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)


command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'down': '40%',
  \     'options': '--with-nth 1 
  \                 --reverse 
  \                 --prompt "> " 
  \                 --preview-window="70%" 
  \                 --preview "
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
  \                     head -n 16"'
  \ })


" ##############################
" #
" # 修复悬浮窗文字配色不能设置问题
" #
" ##############################

colorscheme gruvbox
augroup color
	autocmd!
	autocmd BufRead,BufNewFile * colorscheme gruvbox
	autocmd BufRead,BufNewFile * hi Pmenu ctermbg=DarkGrey
augroup END

