" general configuration
" set number
set wrap
set nu
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4
set smarttab
syntax on
colorscheme industry
set termguicolors
highlight Folded guibg=DarkBlue
set foldcolumn=1
highlight FoldColumn guibg=Black
highlight FoldColumn guifg=White
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=White guibg=DarkBlue
"highlight Pmenu ctermfg=White ctermbg=DarkBlue guifg=White guibg=DarkBlue
filetype plugin indent on
let mapleader = " " "maps leader to spacebar
packadd termdebug

" disable parenthesis matching
hi MatchParen guifg=mediumpurple guibg=black

" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/lervag/vimtex.git'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ahmedkhalf/project.nvim'
Plug 'tamago324/nlsp-settings.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'onsails/diaglist.nvim'
Plug 'vim-scripts/cmdalias.vim'

" Rust
"Plug 'simrat39/rust-tools.nvim'
Plug 'mrcjkb/rustaceanvim'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'https://github.com/SirVer/ultisnips.git'
"Plug 'https://github.com/honza/vim-snippets.git'
"Plug 'https://github.com/Shougo/deoplete.nvim.git'
"Plug 'https://github.com/vim-syntastic/syntastic.git'
"Plug 'https://github.com/artur-shaik/vim-javacomplete2.git'
"Plug 'https://github.com/deoplete-plugins/deoplete-jedi.git'
"Plug 'davidhalter/jedi-vim'
"Plug 'https://github.com/ervandew/supertab.git'
"Plug 'zacharied/lc3.vim'
"Plug 'daeyun/vim-matlab'
"Plug 'https://github.com/nachumk/systemverilog.vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
"Plug 'rustushki/JavaImp.vim'

"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'thomasfaingnaert/vim-lsp-snippets'
"Plug 'thomasfaingnaert/vim-lsp-ultisnips'
"Plug 'lighttiger2505/deoplete-vim-lsp'
call plug#end()
" vim scripts and local plugins
source ~/.config/nvim/plugin/restore_view.vim
source ~/.config/nvim/plugin/jpythonfold.vim
source ~/.config/nvim/plugin/matchit.vim
source ~/.config/nvim/ftplugin/matlab.vim

" Lua setup
lua require('init')

" LuaSnip setup
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" gutentags configuration
"let g:gutentags_project_root = ['tags'] 
"let g:gutentags_generate_on_empty_buffer = 1
"let g:gutentags_generate_on_new = 1
"let g:gutentags_generate_on_missing = 1
"let g:gutentags_generate_on_write = 1
" deoplete configuration
" deoplete sources
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})

"let g:deoplete#enable_at_startup = 1
"let g:depolete#ignore_case = 1
"let g:depolete#num_processes = 0
"let g:depolete#auto_complete = 0

" ultisnips configuration
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsEditSplit="vertical"

" lsp configuration
"let g:lsp_diagnostics_enabled = 0
"let g:lsp_hover_ui = 'preview'
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
" vimtex configuration
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:tex_fold_enabled=1
let g:vimtex_quickfix_enabled=0
"set g:vimtex_compiler_progname = 'nvr'
let g:vimtex_log_ignore = [
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
	\]

" supertab configuration
"let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabClosePreviewOnPopupClose = 1

" Bash Configuration
"let g:is_bash = 1
"let g:sh_fold_enabled = 7

" Java Configuration
"let g:JavaImpDataDir = $HOME . "/.cache/JavaImp"
"let g:JavaImpPaths =
"	\ "/usr/lib/jvm" .
"	\ "/home/base/urc/SW8S-Java/app/src/main/java"
"let g:JavaImpNewLineAtEnd = 1

" Python Configuration
" assuming I'll be using the one virtual environment (may need to change
" this later)
" let g:python3_host_prog = '/home/base/programming/python/virtual-environment/bin/python3.8'
"let python_highlight_all = 1
"let g:jedi#completions_enabled = 0
"let g:syntastic_python_checkers = ['pylint']

" LC-3 Configuration
let lc3_detect_asm=1
autocmd! BufRead,BufNewFile *.asm setlocal textwidth=80
autocmd! BufRead,BufNewFile *.asm setlocal formatoptions=cqt

" MATLAB Configuration
let g:matlab_auto_mappings = 0
"autocmd FileType matlab unmap <buffer><silent> <C-h>
"autocmd VimEnter matlab unmap <buffer><silent> <C-l>
command Ms MatlabLaunchServer

" fzf.vim Configuration
let $FZF_DEFAULT_COMMAND='rg --files'
map <leader>ff :Files<CR>
map <leader>fgl :GFiles<CR>
map <leader>fgs :GFiles?<CR>
map <leader>fbu :Buffers<CR>
map <leader>fr :Rg<CR> 
map <leader>fl :Lines<CR>
map <leader>fbl :BLines<CR>
map <leader>ft :Tags<CR>
map <leader>fbt :BTags<CR>
map <leader>fm :Marks<CR>
map <leader>fhi :History<CR>
map <leader>fhc :History:<CR>
map <leader>f/ :History/<CR>
map <leader>fs :Snippets<CR>
map <leader>fgc :Commits<CR>
map <leader>fgb :BCommits<CR>
map <leader>fc :Commands<CR>
map <leader>fhe :Helptags<CR>
map <leader>fi :Filetypes<CR>
" shorter custom commands
" Folding
command Fs setlocal foldmethod=syntax
command Fi setlocal foldmethod=indent
command Fm setlocal foldmethod=manual
command Fe setlocal foldmethod=expr
command Fmark setlocal foldmethod=marker
command Fd setlocal foldmethod=diff
command Fo set foldcolumn=0
command F set foldcolumn=1
" Executes the following command over the fold
command Fdc folddoc

" JavaComplete
"command Jgenam JCgenerateAbstractMethods
"command Jga JCgenerateAccessors
"command Jgas JCgenerateAcessorSetter
"command Jgag JCgenerateAcessorGetter
"command Jgsg JCgenerateAcessorSetterGetter
"command Jgstr JCgenerateToString
"command Jgeh JCgenerateEqualsAndHashCode
"command Jgc JCgenerateConstructor
"command Jgcd JCgenerateConstructorDefault
"command Jnc JCclassNew
"command Jncf JCclassInFile

" Vimtex
command Ctex VimtexCompile

" Eclim
"command Jdmk JavaDocComment
"command Jd JavaDocPreview
"command Jdg Javadoc
"command Jc JavaCorrect
"command Js JavaSearch
"command Jr JavaRename
"command Jm JavaMove
"command Ru RefactorUndo
"command Rup RefactorUndoPeek
"command Rr RefactorRedo
"command Rrp RefactorRedoPeek
"command Jh JavaHierarchy
"command Jhc JavaCallHierarchy
"command Jo JavaOutline
"command Ji JavaImport
"command Jio JavaImportOrganize
"command Jn JavaNew
"command Jcon JavaConstructor
"command Jg JavaGet
"command Jset JavaSet
"command Jgs JavaGetSet
"command Jim JavaImpl
"command Jdel JavaDelegate
"command Ju JUnit
"command Juf JUnitFindTest
"command Jur JUnitResult
"command Jui JUnitImpl

" shortenings for standard commands
command Sp setlocal spell
command Ft filetype
command Ftd filetype detect
" shortcut keybinds
" split window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" terminal normal mode via escape
tnoremap <Esc> <C-\><C-n>

" Leader keys
map <leader>h :nohl<CR>
"map <leader>t <C-]>
map <leader>t <C-w>]
"map <leader>k :LspHover<CR>

" Float to split
map <leader>k KK:sleep 100m<CR>:sp<CR><C-W><C-J>

" Init diagnostics
" map <leader>cc <cmd>lua require('diaglist').open_all_diagnostics()<cr>
" command OpenDiagnostics lua require('diaglist').open_all_diagnostics()
" autocmd VimEnter * Alias clist OpenDiagnostics
autocmd VimEnter * lua require('diaglist.quickfix').populate_qflist()

" Diagonistic jumping
nnoremap ]f :cbelow<CR>
nnoremap [f :cabove<CR>
map <leader>co :copen<CR>
map <leader>cl :clist<CR>

" Auto formatting on write
autocmd BufWritePre * lua vim.lsp.buf.format()

" Shortcut to reload LSP
map <leader>ls :LspReload<CR>

" Always put buffers on project root
autocmd BufAdd * ProjectRoot
map <leader>pr :ProjectRoot<CR>
