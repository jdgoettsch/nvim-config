call plug#begin('~/.local/share/nvim/plugged')
Plug 'dense-analysis/ale', { 'branch': 'master' }
Plug 'jiangmiao/auto-pairs', { 'branch': 'master' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ellisonleao/glow.nvim', { 'branch': 'main' }
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'master' }
Plug 'neovim/nvim-lspconfig', { 'branch': 'master' }
Plug 'nvim-lualine/lualine.nvim', { 'branch': 'master' }
Plug 'nvim-tree/nvim-web-devicons', { 'branch': 'master' }
Plug 'lambdalisue/suda.vim', { 'branch': 'master' }
Plug 'godlygeek/tabular', { 'branch': 'master' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master', 'do': ':TSUpdate' }
Plug 'SirVer/ultisnips', { 'branch': 'master' }
Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
Plug 'Vimjas/vim-python-pep8-indent', { 'branch': 'master' }
Plug 'rodjek/vim-puppet', { 'branch': 'master' }
Plug 'honza/vim-snippets', { 'branch': 'master' }
Plug 'tpope/vim-vinegar', { 'branch': 'master' }
call plug#end()

set background=light
set cursorline
set ignorecase
set number
set termguicolors
colorscheme tokyonight-day


" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],}
let g:ale_virtualtext_cursor = 'disabled'  " turn off inline errors


" coc.nvim
" https://github.com/neoclide/coc.nvim

let g:coc_global_extensions = [
    \'coc-css',
    \'coc-eslint',
    \'coc-html',
    \'coc-htmldjango',
    \'coc-jedi',
    \'coc-json',
    \'coc-markdownlint',
    \'coc-snippets',
    \'coc-solargraph',
    \'coc-sql',
    \'coc-stylelintplus',
    \'coc-tsserver',
    \'coc-yaml',
    \'coc-yank',
\]

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
set fileencodings=utf-8,latin1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Set to 'yes' to avoid mangling line numbers
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" coc-snippets
" https://github.com/neoclide/coc-snippets
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" gitgutter
" Prioritize errors over git changes
let g:gitgutter_sign_allow_clobber = 0


" glow
"
lua << EOF
require('glow').setup()
EOF


" indent-blankline
"
lua << EOF
vim.opt.termguicolors = true
vim.opt.list = true

require("ibl").setup ()
EOF

" lspconfig
"

" lualine
"
lua << EOF
-- Shows 'MI:line' in lualine when both tab and spaces are used for indenting current buffer.
function mixed_indent()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = vim.fn.search(space_pat, 'nwc')
    local tab_indent = vim.fn.search(tab_pat, 'nwc')
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
        mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
        mixed = mixed_same_line > 0
    end
    if not mixed then return '' end
        if mixed_same_line ~= nil and mixed_same_line > 0 then
            return 'MI:'..mixed_same_line
        end
        local space_indent_cnt = vim.fn.searchcount({pattern=space_pat, max_count=1e3}).total
        local tab_indent_cnt =  vim.fn.searchcount({pattern=tab_pat, max_count=1e3}).total
        if space_indent_cnt > tab_indent_cnt then
            return 'MI:'..tab_indent
        else
            return 'MI:'..space_indent
        end
    end
    require('lualine').setup({
        sections = {
            lualine_c = {
                {
                    'filename',
                    path = 2
                }
            },
            lualine_z = { 'location', mixed_indent },
        }
    })
EOF

" nvim-treesitter
"
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "awk", "bash",  "c", "cmake", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "html", "htmldjango", "http", "ini", "javascript", "json", "lua", "make", "markdown", "markdown_inline", "passwd", "perl", "php", "phpdoc", "python", "query", "ruby", "scss", "sql", "vim", "vimdoc", "yaml" },
    auto_install = true,
    highlight = {
        enable = true
    },
    -- Needed because treesitter highlight turns off autoindent for php files
    indent = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
}
EOF

" sql
"
" Open all .sql files at utf-8
augroup SqlUtf8
  autocmd!
  autocmd BufReadPre,BufNewFile *.sql set fileencodings=utf-8,latin1
  autocmd BufReadPost *.sql if &fileencoding != 'utf-8' | e ++enc=utf-8 | endif
augroup END

" tokyonight
"
lua << EOF
require("tokyonight").setup({
    style = "dark",
    light_style = "day",
})
EOF
