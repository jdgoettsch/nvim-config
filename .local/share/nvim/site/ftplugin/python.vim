let g:ale_linters = {'python': ['flake8', 'mypy', 'pycodestyle'],}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace'],}
let g:ale_python_flake8_options = '-m flake8 --max-line-length=120'
setlocal textwidth=119
