vim.snippet.add(
  "pr",
  'println!("${1:text}");',
  { buffer = 0 }
)

vim.snippet.add(
  "mdtst",
  'mod tests {\n    use super::*;\n\n    #[test]\n    fn ${1:testname}() {\n        ${2:body}\n    }\n}',
  { buffer = 0 }
)

vim.snippet.add(
  "tst",
  '#[test]\nfn ${1:testname}() {\n    ${2:body}\n}',
  { buffer = 0 }
)
