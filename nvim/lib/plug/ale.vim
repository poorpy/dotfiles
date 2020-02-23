let g:ale_linters = {
            \'rust': [],
            \'python': [],
            \'cpp' : ['clangtidy', 'clazy'],
            \'c' : ['clang'],
            \}

let g:ale_fixers = {
            \ '*' : ['remove_trailing_lines', 'trim_whitespace'],
            \}

let g:ale_fix_on_save = 1
let g:ale_c_clang_options = '-std=gnu11 -Wall -Werror'
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Werror'
let g:ale_cpp_clangtidy_checks = ['cppcoreguidelines-*', 'readability-*', 'bugprone-*']
