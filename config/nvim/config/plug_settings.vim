" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" UtilSnips tigger config.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" fzf settings
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <c-P> :ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~20%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber nonumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Theme init
set background=dark "Setting dark theme
colors gruvbox

" Airline init
let g:airline_theme='angr'
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
set laststatus=2

" ctags -- Use tags file in the directory
set tags=tags;/

" set terminal color to 256
set t_Co=256

" Toggle rainbow vim
let g:rainbow_active = 1

" Space with NERDCommenter
let g:NERDCommenter = 1

" Settings for Tsuquyomi
let g:tsuquyomi_completion_detail = 1
augroup tsuquyomi_settings
  autocmd!
  autocmd FileType typescript setlocal completeopt+=menu,preview
augroup end

" Setting for delimMate
augroup delimMate_settings
  au FileType racket let b:loaded_delimitMate = 1
augroup end

" Markdown setup
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" vim-gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['build.sbt']
let g:gutentags_define_advanced_commands = 1
let g:gutentags_project_info = []
let g:gutentags_file_list_command = {
  \ 'markers': {
    \ 'built.sbt': 'find . -type f | grep "\.scala"',
    \ },
  \ }

" Only run gutentags for scala files
function! OnlyScala(path) abort
  echo fnamemodify(a:path, ':e') == 'scala'
endfunction

let g:gutentags_enabled_user_func = 'OnlyScala'
