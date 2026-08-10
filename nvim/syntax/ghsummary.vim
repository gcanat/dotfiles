" Vim syntax file for GitHub repo activity summary buffers

if exists("b:current_syntax")
  finish
endif

" Section headers, e.g. "Recent commits:", "Branches (last-updated):"
syntax match ghsSection "^\a.*\(:$\|(last-updated):\)"
syntax match ghsSection "^Relevant pull requests in .*$"

" Commit hashes (12 hex chars at start of a commit line)
syntax match ghsHash "^\s\+\zs[0-9a-f]\{12}\ze\s"

" PR / issue numbers, e.g. "#20975"
syntax match ghsNumber "#\d\+"

" "patch 9.2.0925" style version strings
"syntax match ghsVersion "\<patch \d\+\.\d\+\.\d\+\>"

" Prefixes like "CI:", "runtime(doc):", "runtime(sh):"
syntax match ghsTag "\s\+\zs\(patch \)\?[a-zA-Z0-9()._/!,`'-]\+\(([a-z]\+)\)\?:\ze "

" Branch/tree paths, e.g. vim/vim/tree/master
syntax match ghsPath "\<\S\+/\S\+/tree/\S\+"

" URLs
syntax match ghsUrl "https\?://\S\+"

" "You have no ..." placeholder lines
syntax match ghsEmpty "^\s\+You have no .*$"

" Truncation ellipsis some tools leave at line end
syntax match ghsEllipsis "…$"

highlight default link ghsSection   Title
highlight default link ghsHash      Identifier
highlight default link ghsNumber    Constant
"highlight default link ghsVersion   Special
highlight default link ghsTag       Type
highlight default link ghsPath      Directory
highlight default link ghsUrl       Underlined
highlight default link ghsEmpty     Comment
highlight default link ghsEllipsis  NonText

let b:current_syntax = "ghsummary"
