let g:ale_linters = {'python': ['bandit', 'mypy', 'pycodestyle', 'pylint'],}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace'],}
" let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_pylint_options = '--disable=invalid-name --disable=redefined-outer-name --disable=wrong-import-order --max-line-length=120'
setlocal textwidth=119
