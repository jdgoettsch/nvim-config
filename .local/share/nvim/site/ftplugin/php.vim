let g:ale_linters = {'php': ['php', 'phpcs', 'phpstan', 'phpmd']}
" let g:ale_fixers = {'php': ['remove_trailing_lines', 'trim_whitespace', 'php_cs_fixer'],}
let g:ale_fixers = {'php': ['remove_trailing_lines', 'trim_whitespace'],}
let g:ale_php_phpcs_executable = './vendor/bin/phpcs'
let g:ale_php_phpmd_executable = './vendor/bin/phpmd'
let g:ale_php_phpstan_executable = './vendor/bin/phpstan'
lua << EOF
require'lspconfig'.phpactor.setup{
    on_attach = on_attach,
    init_options = {
    }
}
EOF
