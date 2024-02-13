set background=dark
hi clear

let g:colors_name = "tokyonight"

hi SpecialKey gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi EndOfBuffer gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=NONE ctermfg=234 ctermbg=NONE
hi TermCursor gui=reverse,inverse term=reverse,inverse cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi clear TermCursorNC
hi NonText gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi Directory gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi ErrorMsg gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi IncSearch gui=NONE term=NONE cterm=NONE guifg=#15161e guibg=#ff9e64 ctermfg=233 ctermbg=215
hi Search gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#3d59a1 ctermfg=251 ctermbg=61
hi link CurSearch IncSearch
hi MoreMsg gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi ModeMsg gui=bold term=bold cterm=bold guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi LineNr gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr
hi CursorLineNr gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=NONE ctermfg=243 ctermbg=NONE
hi link CursorLineSign SignColumn
hi link CursorLineFold FoldColumn
hi Question gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi StatusLine gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi StatusLineNC gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=#16161e ctermfg=238 ctermbg=233
hi WinSeparator gui=bold term=bold cterm=bold guifg=#15161e guibg=NONE ctermfg=233 ctermbg=NONE
hi VertSplit gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#15161e ctermfg=233 ctermbg=NONE
hi Title gui=bold term=bold cterm=bold guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi Visual gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#283457 ctermfg=NONE ctermbg=236
hi clear VisualNC
hi WarningMsg gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi WildMenu gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#283457 ctermfg=NONE ctermbg=236
hi Folded gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=#3b4261 ctermfg=111 ctermbg=238
hi FoldColumn gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=#1a1b26 ctermfg=60 ctermbg=234
hi DiffAdd gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#20303b ctermfg=NONE ctermbg=236
hi DiffChange gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#1f2231 ctermfg=NONE ctermbg=235
hi DiffDelete gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#37222c ctermfg=NONE ctermbg=235
hi DiffText gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#394b70 ctermfg=NONE ctermbg=238
hi SignColumn gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=#1a1b26 ctermfg=238 ctermbg=234
hi Conceal gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=NONE ctermfg=243 ctermbg=NONE
hi SpellBad gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#db4b4b
hi SpellCap gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#e0af68
hi SpellRare gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#1abc9c
hi SpellLocal gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#0db9d7
hi Pmenu gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi PmenuSel gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#343a55 ctermfg=NONE ctermbg=237
hi link PmenuKind Pmenu
hi link PmenuKindSel PmenuSel
hi link PmenuExtra Pmenu
hi link PmenuExtraSel PmenuSel
hi PmenuSbar gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#222229 ctermfg=NONE ctermbg=235
hi PmenuThumb gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi TabLine gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=#16161e ctermfg=238 ctermbg=233
hi TabLineSel gui=NONE term=NONE cterm=NONE guifg=#15161e guibg=#7aa2f7 ctermfg=233 ctermbg=111
hi TabLineFill gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#15161e ctermfg=NONE ctermbg=233
hi CursorColumn gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#292e42 ctermfg=NONE ctermbg=236
hi CursorLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#292e42 ctermfg=NONE ctermbg=236
hi ColorColumn gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#15161e ctermfg=NONE ctermbg=233
hi QuickFixLine gui=bold term=bold cterm=bold guifg=NONE guibg=#283457 ctermfg=NONE ctermbg=236
hi Whitespace gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi NormalNC gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi link MsgSeparator StatusLine
hi NormalFloat gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi MsgArea gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi FloatBorder gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=#16161e ctermfg=37 ctermbg=233
hi link WinBar StatusLine
hi link WinBarNC StatusLineNC
hi Cursor gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#c0caf5 ctermfg=234 ctermbg=251
hi FloatTitle gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=#16161e ctermfg=37 ctermbg=233
hi lCursor gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#c0caf5 ctermfg=234 ctermbg=251
hi Normal gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi Substitute gui=NONE term=NONE cterm=NONE guifg=#15161e guibg=#f7768e ctermfg=233 ctermbg=210
hi FloatShadow gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#000000 ctermfg=NONE ctermbg=0
hi FloatShadowThrough gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#000000 ctermfg=NONE ctermbg=0
hi RedrawDebugNormal gui=reverse,inverse term=reverse,inverse cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi RedrawDebugClear gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#ffff00 ctermfg=NONE ctermbg=11
hi RedrawDebugComposed gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#008000 ctermfg=NONE ctermbg=2
hi RedrawDebugRecompose gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#ff0000 ctermfg=NONE ctermbg=9
hi Error gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi Todo gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#e0af68 ctermfg=234 ctermbg=179
hi String gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi Constant gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi Character gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi link Number Constant
hi link Boolean Constant
hi link Float Constant
hi Function gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi Identifier gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi link Conditional Statement
hi Statement gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi link Repeat Statement
hi link Label Statement
hi Operator gui=NONE term=NONE cterm=NONE guifg=#89ddff guibg=NONE ctermfg=117 ctermbg=NONE
hi Keyword gui=italic term=italic cterm=italic guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi link Exception Statement
hi link Include PreProc
hi PreProc gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi Type gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi Special gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi Debug gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi DiagnosticError gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi DiagnosticWarn gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi DiagnosticInfo gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi DiagnosticHint gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi DiagnosticOk gui=NONE term=NONE cterm=NONE guifg=#90ee90 guibg=NONE ctermfg=120 ctermbg=NONE
hi DiagnosticUnderlineError gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#db4b4b
hi DiagnosticUnderlineWarn gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#e0af68
hi DiagnosticUnderlineInfo gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#0db9d7
hi DiagnosticUnderlineHint gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#1abc9c
hi DiagnosticUnderlineOk gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#90ee90
hi DiagnosticVirtualTextError gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=#2d202a ctermfg=167 ctermbg=235
hi DiagnosticVirtualTextWarn gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#2e2a2d ctermfg=179 ctermbg=235
hi DiagnosticVirtualTextInfo gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#192b38 ctermfg=38 ctermbg=235
hi DiagnosticVirtualTextHint gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=#1a2b32 ctermfg=37 ctermbg=235
hi link DiagnosticVirtualTextOk DiagnosticOk
hi link DiagnosticFloatingError DiagnosticError
hi link DiagnosticFloatingWarn DiagnosticWarn
hi link DiagnosticFloatingInfo DiagnosticInfo
hi link DiagnosticFloatingHint DiagnosticHint
hi link DiagnosticFloatingOk DiagnosticOk
hi link DiagnosticSignError DiagnosticError
hi link DiagnosticSignWarn DiagnosticWarn
hi link DiagnosticSignInfo DiagnosticInfo
hi link DiagnosticSignHint DiagnosticHint
hi link DiagnosticSignOk DiagnosticOk
hi DiagnosticDeprecated gui=NONE term=NONE cterm=NONE guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff0000
hi DiagnosticUnnecessary gui=NONE term=NONE cterm=NONE guifg=#414868 guibg=NONE ctermfg=238 ctermbg=NONE
hi Comment gui=italic term=italic cterm=italic guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi Underlined gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MatchParen gui=bold term=bold cterm=bold guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi clear Ignore
hi NvimInternalError gui=NONE term=NONE cterm=NONE guifg=#ff0000 guibg=#ff0000 ctermfg=9 ctermbg=9
hi link NvimAssignment Operator
hi link NvimPlainAssignment Operator
hi link NvimAugmentedAssignment Operator
hi link NvimAssignmentWithAddition Operator
hi link NvimAssignmentWithSubtraction Operator
hi link NvimAssignmentWithConcatenation Operator
hi link NvimOperator Operator
hi link NvimUnaryOperator Operator
hi link NvimUnaryPlus Operator
hi link NvimUnaryMinus Operator
hi link NvimNot Operator
hi link NvimBinaryOperator Operator
hi link NvimComparison Operator
hi link NvimComparisonModifier Operator
hi link NvimBinaryPlus Operator
hi link NvimBinaryMinus Operator
hi link NvimConcat Operator
hi link NvimConcatOrSubscript Operator
hi link NvimOr Operator
hi link NvimAnd Operator
hi link NvimMultiplication Operator
hi link NvimDivision Operator
hi link NvimMod Operator
hi link NvimTernary Operator
hi link NvimTernaryColon Operator
hi link NvimParenthesis Special
hi link NvimLambda Special
hi link NvimNestingParenthesis Special
hi link NvimCallingParenthesis Special
hi link NvimSubscript Special
hi link NvimSubscriptBracket Special
hi link NvimSubscriptColon Special
hi link NvimCurly Special
hi link NvimContainer Special
hi link NvimDict Special
hi link NvimList Special
hi link NvimIdentifier Identifier
hi link NvimIdentifierScope Identifier
hi link NvimIdentifierScopeDelimiter Identifier
hi link NvimIdentifierName Identifier
hi link NvimIdentifierKey Identifier
hi link NvimColon Special
hi link NvimComma Special
hi link NvimArrow Special
hi link NvimRegister Special
hi link NvimNumber Constant
hi link NvimFloat Constant
hi link NvimNumberPrefix Type
hi link NvimOptionSigil Type
hi link NvimOptionName Identifier
hi link NvimOptionScope Identifier
hi link NvimOptionScopeDelimiter Identifier
hi link NvimEnvironmentSigil Type
hi link NvimEnvironmentName Identifier
hi link NvimString String
hi link NvimStringBody String
hi link NvimStringQuote String
hi link NvimStringSpecial Special
hi link NvimSingleQuote String
hi link NvimSingleQuotedBody String
hi link NvimSingleQuotedQuote Special
hi link NvimDoubleQuote String
hi link NvimDoubleQuotedBody String
hi link NvimDoubleQuotedEscape Special
hi link NvimFigureBrace NvimInternalError
hi link NvimSingleQuotedUnknownEscape NvimInternalError
hi link NvimSpacing Normal
hi link NvimInvalidSingleQuotedUnknownEscape NvimInternalError
hi link NvimInvalid Error
hi link NvimInvalidAssignment Error
hi link NvimInvalidPlainAssignment Error
hi link NvimInvalidAugmentedAssignment Error
hi link NvimInvalidAssignmentWithAddition Error
hi link NvimInvalidAssignmentWithSubtraction Error
hi link NvimInvalidAssignmentWithConcatenation Error
hi link NvimInvalidOperator Error
hi link NvimInvalidUnaryOperator Error
hi link NvimInvalidUnaryPlus Error
hi link NvimInvalidUnaryMinus Error
hi link NvimInvalidNot Error
hi link NvimInvalidBinaryOperator Error
hi link NvimInvalidComparison Error
hi link NvimInvalidComparisonModifier Error
hi link NvimInvalidBinaryPlus Error
hi link NvimInvalidBinaryMinus Error
hi link NvimInvalidConcat Error
hi link NvimInvalidConcatOrSubscript Error
hi link NvimInvalidOr Error
hi link NvimInvalidAnd Error
hi link NvimInvalidMultiplication Error
hi link NvimInvalidDivision Error
hi link NvimInvalidMod Error
hi link NvimInvalidTernary Error
hi link NvimInvalidTernaryColon Error
hi link NvimInvalidDelimiter Error
hi link NvimInvalidParenthesis Error
hi link NvimInvalidLambda Error
hi link NvimInvalidNestingParenthesis Error
hi link NvimInvalidCallingParenthesis Error
hi link NvimInvalidSubscript Error
hi link NvimInvalidSubscriptBracket Error
hi link NvimInvalidSubscriptColon Error
hi link NvimInvalidCurly Error
hi link NvimInvalidContainer Error
hi link NvimInvalidDict Error
hi link NvimInvalidList Error
hi link NvimInvalidValue Error
hi link NvimInvalidIdentifier Error
hi link NvimInvalidIdentifierScope Error
hi link NvimInvalidIdentifierScopeDelimiter Error
hi link NvimInvalidIdentifierName Error
hi link NvimInvalidIdentifierKey Error
hi link NvimInvalidColon Error
hi link NvimInvalidComma Error
hi link NvimInvalidArrow Error
hi link NvimInvalidRegister Error
hi link NvimInvalidNumber Error
hi link NvimInvalidFloat Error
hi link NvimInvalidNumberPrefix Error
hi link NvimInvalidOptionSigil Error
hi link NvimInvalidOptionName Error
hi link NvimInvalidOptionScope Error
hi link NvimInvalidOptionScopeDelimiter Error
hi link NvimInvalidEnvironmentSigil Error
hi link NvimInvalidEnvironmentName Error
hi link NvimInvalidString Error
hi link NvimInvalidStringBody String
hi link NvimInvalidStringQuote Error
hi link NvimInvalidStringSpecial Special
hi link NvimInvalidSingleQuote Error
hi link NvimInvalidSingleQuotedBody String
hi link NvimInvalidSingleQuotedQuote Special
hi link NvimInvalidDoubleQuote Error
hi link NvimInvalidDoubleQuotedBody String
hi link NvimInvalidDoubleQuotedEscape Special
hi link NvimInvalidDoubleQuotedUnknownEscape Error
hi link NvimInvalidFigureBrace Error
hi link NvimInvalidSpacing ErrorMsg
hi link NvimDoubleQuotedUnknownEscape Error
hi clear Terminal
hi clear StatuslineTerm
hi clear StatuslineTermNC
hi clear MessageWindow
hi clear PopupNotification
hi clear javaScriptFunction
hi clear javaScriptIdentifier
hi clear sqlKeyword
hi clear yamlBlockMappingKey
hi clear rubyMacro
hi clear rubyDefine
hi clear vimVar
hi clear vimOper
hi clear vimSep
hi clear vimParenSep
hi clear vimCommentString
hi clear gitCommitSummary
hi clear markdownUrl
hi clear elixirOperator
hi clear elixirKeyword
hi clear elixirBlockDefinition
hi clear elixirDefine
hi clear elixirPrivateDefine
hi clear elixirGuard
hi clear elixirPrivateGuard
hi clear elixirModuleDefine
hi clear elixirProtocolDefine
hi clear elixirImplDefine
hi clear elixirRecordDefine
hi clear elixirPrivateRecordDefine
hi clear elixirMacroDefine
hi clear elixirPrivateMacroDefine
hi clear elixirDelegateDefine
hi clear elixirOverridableDefine
hi clear elixirExceptionDefine
hi clear elixirCallbackDefine
hi clear elixirStructDefine
hi clear elixirExUnitMacro
hi clear elixirInclude
hi clear elixirAtom
hi clear elixirDocTest
hi ALEErrorSign gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi clear ALEInfoSign
hi ALEWarningSign gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi clear ALEError
hi clear ALEVirtualTextError
hi clear ALEWarning
hi clear ALEVirtualTextWarning
hi clear ALEInfo
hi clear ALEVirtualTextInfo
hi clear ToolbarLine
hi clear ToolbarButton
hi VisualNOS gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#283457 ctermfg=NONE ctermbg=236
hi debugPC gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi debugBreakpoint gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#192b38 ctermfg=38 ctermbg=235
hi diffAdded gui=NONE term=NONE cterm=NONE guifg=#449dab guibg=NONE ctermfg=73 ctermbg=NONE
hi diffRemoved gui=NONE term=NONE cterm=NONE guifg=#914c54 guibg=NONE ctermfg=95 ctermbg=NONE
hi clear diffSubname
hi link LazyTaskError ErrorMsg
hi link LazyReasonRequire Identifier
hi link LazyProp Conceal
hi link LazyReasonKeys Statement
hi LazyProgressTodo gui=bold term=bold cterm=bold guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi link LazyReasonEvent Constant
hi link LazyUrl Identifier
hi link LazyReasonPlugin Special
hi link LazyButton CursorLine
hi link LazyReasonRuntime PreProc
hi link LazyDimmed Conceal
hi link LazyButtonActive Visual
hi link LazyCommitScope Italic
hi Italic gui=italic term=italic cterm=italic guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link LazyCommitType Title
hi link LazyCommitIssue Constant
hi link LazyNormal NormalFloat
hi link LazyNoCond DiagnosticWarn
hi link LazyH2 Bold
hi Bold gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link LazyH1 IncSearch
hi link LazyDir Identifier
hi link LazyLocal Constant
hi link LazyComment Comment
hi link LazyReasonFt Character
hi LazyProgressDone gui=bold term=bold cterm=bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi link LazyReasonCmd Operator
hi link LazyValue String
hi link LazyReasonSource Character
hi link LazyReasonImport Identifier
hi link LazyTaskOutput MsgArea
hi link LazyReasonStart Identifier
hi clear CmpCompletion
hi clear CmpCompletionBorder
hi clear CmpCompletionSbar
hi clear CmpCompletionSel
hi clear CmpCompletionThumb
hi CmpDocumentation gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi CmpDocumentationBorder gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=#16161e ctermfg=37 ctermbg=233
hi CmpItemAbbr gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi CmpItemAbbrDeprecated gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi CmpItemAbbrMatch gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi CmpItemAbbrMatchFuzzy gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi link CmpItemKindClass Type
hi link CmpItemKindConstant Constant
hi CmpItemKindCopilot gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi CmpItemKindDefault gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi link CmpItemKindEnum Type
hi link CmpItemKindEnumMember Constant
hi link CmpItemKindFile Normal
hi link CmpItemKindFolder Directory
hi link CmpItemKindFunction Function
hi link CmpItemKindMethod Function
hi link CmpItemKindModule PreProc
hi link CmpItemKindSnippet Conceal
hi link CmpItemKindStruct Type
hi link CmpItemKindTypeParameter Type
hi link CmpItemKindValue String
hi CmpItemMenu gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi CursorIM gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#c0caf5 ctermfg=234 ctermbg=251
hi clear DapUIBreakpointsCurrentLine
hi clear DapUIBreakpointsDisabledLine
hi clear DapUIBreakpointsInfo
hi clear DapUIBreakpointsPath
hi clear DapUIDecoration
hi clear DapUIFloatBorder
hi clear DapUILineNumber
hi clear DapUIModifiedValue
hi clear DapUIPlayPause
hi clear DapUIRestart
hi clear DapUIScope
hi clear DapUISource
hi clear DapUIStepBack
hi clear DapUIStepInto
hi clear DapUIStepOut
hi clear DapUIStepOver
hi clear DapUIStop
hi clear DapUIStoppedThread
hi clear DapUIThread
hi clear DapUIType
hi clear DapUIUnavailable
hi clear DapUIWatchesEmpty
hi clear DapUIWatchesError
hi clear DapUIWatchesValue
hi DashboardCenter gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi DashboardDesc gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi DashboardFooter gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi DashboardHeader gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi DashboardIcon gui=bold term=bold cterm=bold guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi DashboardKey gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi DashboardShortCut gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi clear FloatFooter
hi clear FloatermBorder
hi GitSignsAdd gui=NONE term=NONE cterm=NONE guifg=#266d6a guibg=NONE ctermfg=23 ctermbg=NONE
hi GitSignsChange gui=NONE term=NONE cterm=NONE guifg=#536c9e guibg=NONE ctermfg=61 ctermbg=NONE
hi GitSignsDelete gui=NONE term=NONE cterm=NONE guifg=#b2555b guibg=NONE ctermfg=131 ctermbg=NONE
hi IblIndent gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi IblScope gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi clear IblWhitespace
hi IndentBlanklineChar gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi IndentBlanklineContextChar gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi clear IndentBlanklineContextStart
hi clear IndentBlanklineSpaceChar
hi clear IndentBlanklineSpaceCharBlankline
hi LspCodeLens gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi LspReferenceRead gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi LspReferenceText gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi LspReferenceWrite gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi LspSignatureActiveParameter gui=bold term=bold cterm=bold guifg=NONE guibg=#20253a ctermfg=NONE ctermbg=235
hi clear MiniClueBorder
hi clear MiniClueDescGroup
hi clear MiniClueDescSingle
hi clear MiniClueNextKey
hi clear MiniClueNextKeyWithPostkeys
hi clear MiniClueSeparator
hi clear MiniClueTitle
hi MiniCompletionActiveParameter gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MiniCursorword gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi MiniCursorwordCurrent gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi clear MiniStarterCurrent
hi MiniStarterFooter gui=italic term=italic cterm=italic guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi MiniStarterHeader gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi MiniStarterInactive gui=italic term=italic cterm=italic guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi MiniStarterItem gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi MiniStarterItemBullet gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=NONE ctermfg=37 ctermbg=NONE
hi MiniStarterItemPrefix gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi MiniStarterQuery gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi MiniStarterSection gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi MiniStatuslineDevinfo gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#292e42 ctermfg=146 ctermbg=236
hi MiniStatuslineFileinfo gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#292e42 ctermfg=146 ctermbg=236
hi MiniStatuslineFilename gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#3b4261 ctermfg=146 ctermbg=238
hi MiniStatuslineInactive gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=#16161e ctermfg=111 ctermbg=233
hi MiniStatuslineModeCommand gui=bold term=bold cterm=bold guifg=#15161e guibg=#e0af68 ctermfg=233 ctermbg=179
hi MiniStatuslineModeInsert gui=bold term=bold cterm=bold guifg=#15161e guibg=#9ece6a ctermfg=233 ctermbg=149
hi MiniStatuslineModeNormal gui=bold term=bold cterm=bold guifg=#15161e guibg=#7aa2f7 ctermfg=233 ctermbg=111
hi MiniStatuslineModeOther gui=bold term=bold cterm=bold guifg=#15161e guibg=#1abc9c ctermfg=233 ctermbg=37
hi MiniStatuslineModeReplace gui=bold term=bold cterm=bold guifg=#15161e guibg=#f7768e ctermfg=233 ctermbg=210
hi MiniStatuslineModeVisual gui=bold term=bold cterm=bold guifg=#15161e guibg=#bb9af7 ctermfg=233 ctermbg=141
hi MiniSurround gui=NONE term=NONE cterm=NONE guifg=#15161e guibg=#ff9e64 ctermfg=233 ctermbg=215
hi link NavicIconsBoolean Constant
hi link NavicIconsClass Type
hi link NavicIconsConstant Constant
hi link NavicIconsEnum Type
hi link NavicIconsEnumMember Constant
hi clear TSField
hi link NavicIconsEvent Special
hi link NavicIconsFile Normal
hi link NavicIconsFunction Function
hi link NavicIconsMethod Function
hi link NavicIconsModule PreProc
hi clear TSInclude
hi link NavicIconsNamespace PreProc
hi link NavicIconsNull Special
hi link NavicIconsNumber Constant
hi link NavicIconsObject Constant
hi link NavicIconsPackage PreProc
hi clear TSProperty
hi link NavicIconsString String
hi link NavicIconsStruct Type
hi link NavicIconsTypeParameter Type
hi NavicSeparator gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi NavicText gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi clear NeoTreeGitAdded
hi clear NeoTreeGitConflict
hi clear NeoTreeGitDeleted
hi clear NeoTreeGitModified
hi clear NeoTreeGitStaged
hi clear NeoTreeGitUnstaged
hi clear NeoTreeGitUntracked
hi clear NeoTreeIndentMarker
hi clear NeoTreeModified
hi clear NeoTreeRootName
hi clear NeoTreeTabActive
hi clear NeoTreeTabInactive
hi clear NeoTreeTabSeparatorActive
hi clear NeoTreeTabSeparatorInactive
hi NeogitDiffAddHighlight gui=NONE term=NONE cterm=NONE guifg=#449dab guibg=#20303b ctermfg=73 ctermbg=236
hi NeogitDiffContextHighlight gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#2b2f44 ctermfg=146 ctermbg=236
hi NeogitDiffDeleteHighlight gui=NONE term=NONE cterm=NONE guifg=#914c54 guibg=#37222c ctermfg=95 ctermbg=235
hi NeogitHunkHeader gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#292e42 ctermfg=251 ctermbg=236
hi NeogitHunkHeaderHighlight gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=#3b4261 ctermfg=111 ctermbg=238
hi NotifyBackground gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi NotifyDEBUGBorder gui=NONE term=NONE cterm=NONE guifg=#2c2f44 guibg=#1a1b26 ctermfg=236 ctermbg=234
hi NotifyDEBUGIcon gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi NotifyDEBUGTitle gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi NotifyERRORBorder gui=NONE term=NONE cterm=NONE guifg=#542931 guibg=#1a1b26 ctermfg=236 ctermbg=234
hi NotifyERRORIcon gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi NotifyERRORTitle gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi clear NotifyHINTBorder
hi clear NotifyHINTIcon
hi clear NotifyHINTTitle
hi NotifyINFOBorder gui=NONE term=NONE cterm=NONE guifg=#164a5b guibg=#1a1b26 ctermfg=23 ctermbg=234
hi NotifyINFOIcon gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi NotifyINFOTitle gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi NotifyTRACEBorder gui=NONE term=NONE cterm=NONE guifg=#41385b guibg=#1a1b26 ctermfg=237 ctermbg=234
hi NotifyTRACEIcon gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi NotifyTRACETitle gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi NotifyWARNBorder gui=NONE term=NONE cterm=NONE guifg=#55473a guibg=#1a1b26 ctermfg=239 ctermbg=234
hi NotifyWARNIcon gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi NotifyWARNTitle gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi clear NvimTreeExecFile
hi clear NvimTreeFolderName
hi NvimTreeGitDeleted gui=NONE term=NONE cterm=NONE guifg=#914c54 guibg=NONE ctermfg=95 ctermbg=NONE
hi NvimTreeGitDirty gui=NONE term=NONE cterm=NONE guifg=#6183bb guibg=NONE ctermfg=67 ctermbg=NONE
hi NvimTreeGitNew gui=NONE term=NONE cterm=NONE guifg=#449dab guibg=NONE ctermfg=73 ctermbg=NONE
hi clear NvimTreeGitStaged
hi NvimTreeImageFile gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi NvimTreeNormal gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi NvimTreeNormalNC gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi NvimTreeOpenedFile gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#292e42 ctermfg=NONE ctermbg=236
hi NvimTreeRootFolder gui=bold term=bold cterm=bold guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NvimTreeSpecialFile gui=underline term=underline cterm=underline guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi NvimTreeSymlink gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NvimTreeWinSeparator gui=NONE term=NONE cterm=NONE guifg=#16161e guibg=#16161e ctermfg=233 ctermbg=233
hi clear NvimTreeWindowPicker
hi TelescopeBorder gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=#16161e ctermfg=37 ctermbg=233
hi clear TelescopeResultsClass
hi clear TelescopeResultsField
hi clear TelescopeResultsMethod
hi clear TelescopeResultsStruct
hi clear TelescopeResultsVariable
hi clear TelescopeSelection
hi clear TelescopeSelectionCaret
hi clear TelescopeTitle
hi TreesitterContext gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#343a55 ctermfg=NONE ctermbg=237
hi clear TreesitterContextLineNumber
hi diffChanged gui=NONE term=NONE cterm=NONE guifg=#6183bb guibg=NONE ctermfg=67 ctermbg=NONE
hi clear diffDeleted
hi diffNewFile gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi diffOldFile gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi healthError gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi healthSuccess gui=NONE term=NONE cterm=NONE guifg=#73daca guibg=NONE ctermfg=80 ctermbg=NONE
hi healthWarning gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi markdownCode gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi markdownCodeBlock gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi qfFileName gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi qfLineNr gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=NONE ctermfg=243 ctermbg=NONE
hi link LspKindClass Type
hi link AerialClassIcon Type
hi link NoiceCompletionItemKindClass Type
hi link LspKindColor Special
hi link NavicIconsColor Special
hi link AerialColorIcon Special
hi link CmpItemKindColor Special
hi link NoiceCompletionItemKindColor Special
hi link LspKindEnum Type
hi link AerialEnumIcon Type
hi link NoiceCompletionItemKindEnum Type
hi link LspKindEnumMember Constant
hi link AerialEnumMemberIcon Constant
hi link NoiceCompletionItemKindEnumMember Constant
hi link LspKindEvent Special
hi link AerialEventIcon Special
hi link CmpItemKindEvent Special
hi link NoiceCompletionItemKindEvent Special
hi link LspKindFile Normal
hi link AerialFileIcon Normal
hi link NoiceCompletionItemKindFile Normal
hi link LspKindFolder Directory
hi link NavicIconsFolder Directory
hi link AerialFolderIcon Directory
hi link NoiceCompletionItemKindFolder Directory
hi link LspKindMethod Function
hi link AerialMethodIcon Function
hi link NoiceCompletionItemKindMethod Function
hi link LspKindModule PreProc
hi link AerialModuleIcon PreProc
hi link NoiceCompletionItemKindModule PreProc
hi link LspKindNamespace PreProc
hi link AerialNamespaceIcon PreProc
hi link CmpItemKindNamespace PreProc
hi link NoiceCompletionItemKindNamespace PreProc
hi link LspKindNull Special
hi link AerialNullIcon Special
hi link CmpItemKindNull Special
hi link NoiceCompletionItemKindNull Special
hi link LspKindObject Constant
hi link AerialObjectIcon Constant
hi link CmpItemKindObject Constant
hi link NoiceCompletionItemKindObject Constant
hi link LspKindPackage PreProc
hi link AerialPackageIcon PreProc
hi link CmpItemKindPackage PreProc
hi link NoiceCompletionItemKindPackage PreProc
hi link LspKindSnippet Conceal
hi link NavicIconsSnippet Conceal
hi link AerialSnippetIcon Conceal
hi link NoiceCompletionItemKindSnippet Conceal
hi link LspKindStruct Type
hi link AerialStructIcon Type
hi link NoiceCompletionItemKindStruct Type
hi link LspKindUnit Type
hi link NavicIconsUnit Type
hi link AerialUnitIcon Type
hi link CmpItemKindUnit Type
hi link NoiceCompletionItemKindUnit Type
hi link LspKindTypeParameter Type
hi link AerialTypeParameterIcon Type
hi link NoiceCompletionItemKindTypeParameter Type
hi link LspKindString String
hi link AerialStringIcon String
hi link CmpItemKindString String
hi link NoiceCompletionItemKindString String
hi link LspKindFunction Function
hi link AerialFunctionIcon Function
hi link NoiceCompletionItemKindFunction Function
hi LspInlayHint gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=#1d202d ctermfg=60 ctermbg=234
hi rainbowcol1 gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi LspInfoBorder gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=#16161e ctermfg=37 ctermbg=233
hi DapStoppedLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2e2a2d ctermfg=NONE ctermbg=235
hi TSRainbowOrange gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi TSRainbowBlue gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi RainbowDelimiterRed gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi RainbowDelimiterBlue gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi TroubleCount gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=#3b4261 ctermfg=141 ctermbg=238
hi illuminatedWord gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi NeotestPassed gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi NeotestRunning gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi NeotestFailed gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi NeotestSkipped gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeotestTest gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi NeotestNamespace gui=NONE term=NONE cterm=NONE guifg=#41a6b5 guibg=NONE ctermfg=73 ctermbg=NONE
hi NeotestFocused gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi NeotestFile gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi NeotestDir gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeotestBorder gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeotestIndent gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi NeotestExpandMarker gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi NeotestAdapterName gui=bold term=bold cterm=bold guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi NeotestWinSelect gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeotestMarked gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeotestTarget gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi GitGutterAddLineNr gui=NONE term=NONE cterm=NONE guifg=#266d6a guibg=NONE ctermfg=23 ctermbg=NONE
hi GitGutterChangeLineNr gui=NONE term=NONE cterm=NONE guifg=#536c9e guibg=NONE ctermfg=61 ctermbg=NONE
hi GitGutterDeleteLineNr gui=NONE term=NONE cterm=NONE guifg=#b2555b guibg=NONE ctermfg=131 ctermbg=NONE
hi TelescopeNormal gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi NvimTreeIndentMarker gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi NvimTreeFolderIcon gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi NeoTreeNormal gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi NeoTreeNormalNC gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi NeoTreeDimText gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi FernBranchText gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi GlyphPalette1 gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi GlyphPalette2 gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi GlyphPalette3 gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi GlyphPalette4 gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi GlyphPalette6 gui=NONE term=NONE cterm=NONE guifg=#73daca guibg=NONE ctermfg=80 ctermbg=NONE
hi GlyphPalette7 gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi GlyphPalette9 gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi AlphaShortcut gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi AlphaHeader gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi AlphaHeaderLabel gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi AlphaFooter gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi AlphaButtons gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi WhichKey gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi WhichKeyGroup gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi WhichKeyDesc gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi WhichKeySeperator gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi WhichKeySeparator gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi WhichKeyFloat gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi WhichKeyValue gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=NONE ctermfg=243 ctermbg=NONE
hi link DiagnosticWarning DiagnosticWarn
hi link DiagnosticInformation DiagnosticInfo
hi LspFloatWinNormal gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi LspFloatWinBorder gui=NONE term=NONE cterm=NONE guifg=#27a1b9 guibg=NONE ctermfg=37 ctermbg=NONE
hi LspSagaBorderTitle gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi LspSagaHoverBorder gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi LspSagaRenameBorder gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi LspSagaDefPreviewBorder gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi LspSagaCodeActionBorder gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi LspSagaFinderSelection gui=NONE term=NONE cterm=NONE guifg=#283457 guibg=NONE ctermfg=236 ctermbg=NONE
hi LspSagaCodeActionTitle gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi LspSagaCodeActionContent gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi LspSagaSignatureHelpBorder gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi ReferencesCount gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi DefinitionCount gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi DefinitionIcon gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi ReferencesIcon gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi TargetWord gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi BufferLineIndicatorSelected gui=NONE term=NONE cterm=NONE guifg=#6183bb guibg=NONE ctermfg=67 ctermbg=NONE
hi BufferCurrent gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi BufferCurrentERROR gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=#1a1b26 ctermfg=167 ctermbg=234
hi Hlargs gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi Headline1 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#1f2230 ctermfg=NONE ctermbg=235
hi BufferCurrentHINT gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=#1a1b26 ctermfg=37 ctermbg=234
hi BufferCurrentINFO gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#1a1b26 ctermfg=38 ctermbg=234
hi BufferCurrentWARN gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#1a1b26 ctermfg=179 ctermbg=234
hi BufferCurrentIndex gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#1a1b26 ctermfg=38 ctermbg=234
hi BufferCurrentMod gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#1a1b26 ctermfg=179 ctermbg=234
hi BufferCurrentSign gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#1a1b26 ctermfg=234 ctermbg=234
hi BufferCurrentTarget gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=#1a1b26 ctermfg=210 ctermbg=234
hi BufferAlternate gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#3b4261 ctermfg=251 ctermbg=238
hi BufferAlternateERROR gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=#3b4261 ctermfg=167 ctermbg=238
hi BufferAlternateHINT gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=#3b4261 ctermfg=37 ctermbg=238
hi BufferAlternateIndex gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#3b4261 ctermfg=38 ctermbg=238
hi BufferAlternateINFO gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#3b4261 ctermfg=38 ctermbg=238
hi BufferAlternateMod gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#3b4261 ctermfg=179 ctermbg=238
hi BufferAlternateSign gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#3b4261 ctermfg=38 ctermbg=238
hi BufferAlternateTarget gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=#3b4261 ctermfg=210 ctermbg=238
hi BufferAlternateWARN gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#3b4261 ctermfg=179 ctermbg=238
hi BufferVisible gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi BufferVisibleERROR gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=#16161e ctermfg=167 ctermbg=233
hi BufferVisibleHINT gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=#16161e ctermfg=37 ctermbg=233
hi BufferVisibleINFO gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#16161e ctermfg=38 ctermbg=233
hi BufferVisibleWARN gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#16161e ctermfg=179 ctermbg=233
hi BufferVisibleIndex gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#16161e ctermfg=38 ctermbg=233
hi BufferVisibleMod gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#16161e ctermfg=179 ctermbg=233
hi BufferVisibleSign gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#16161e ctermfg=38 ctermbg=233
hi BufferVisibleTarget gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=#16161e ctermfg=210 ctermbg=233
hi BufferInactive gui=NONE term=NONE cterm=NONE guifg=#616789 guibg=#202331 ctermfg=60 ctermbg=235
hi BufferInactiveERROR gui=NONE term=NONE cterm=NONE guifg=#b44144 guibg=#202331 ctermfg=131 ctermbg=235
hi BufferInactiveHINT gui=NONE term=NONE cterm=NONE guifg=#1a9c84 guibg=#202331 ctermfg=36 ctermbg=235
hi BufferInactiveINFO gui=NONE term=NONE cterm=NONE guifg=#1099b4 guibg=#202331 ctermfg=31 ctermbg=235
hi BufferInactiveWARN gui=NONE term=NONE cterm=NONE guifg=#b8915b guibg=#202331 ctermfg=137 ctermbg=235
hi BufferInactiveIndex gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=#202331 ctermfg=243 ctermbg=235
hi BufferInactiveMod gui=NONE term=NONE cterm=NONE guifg=#b8915b guibg=#202331 ctermfg=137 ctermbg=235
hi BufferInactiveSign gui=NONE term=NONE cterm=NONE guifg=#1a1b26 guibg=#202331 ctermfg=234 ctermbg=235
hi BufferInactiveTarget gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=#202331 ctermfg=210 ctermbg=235
hi BufferOffset gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=#16161e ctermfg=243 ctermbg=233
hi BufferTabpageFill gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=#262a3c ctermfg=243 ctermbg=235
hi BufferTabpages gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi Sneak gui=NONE term=NONE cterm=NONE guifg=#292e42 guibg=#bb9af7 ctermfg=236 ctermbg=141
hi SneakScope gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#283457 ctermfg=NONE ctermbg=236
hi HopNextKey gui=bold term=bold cterm=bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi HopNextKey1 gui=bold term=bold cterm=bold guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi HopNextKey2 gui=NONE term=NONE cterm=NONE guifg=#127a90 guibg=NONE ctermfg=6 ctermbg=NONE
hi HopUnmatched gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi TSNodeKey gui=bold term=bold cterm=bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi TSNodeUnmatched gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi LeapMatch gui=bold term=bold cterm=bold guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi LeapLabelPrimary gui=bold term=bold cterm=bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi LeapLabelSecondary gui=bold term=bold cterm=bold guifg=#73daca guibg=NONE ctermfg=80 ctermbg=NONE
hi LeapBackdrop gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi FlashBackdrop gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi FlashLabel gui=bold term=bold cterm=bold guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi LightspeedGreyWash gui=NONE term=NONE cterm=NONE guifg=#545c7e guibg=NONE ctermfg=60 ctermbg=NONE
hi LightspeedLabel gui=underline,bold term=underline,bold cterm=underline,bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi LightspeedLabelDistant gui=underline,bold term=underline,bold cterm=underline,bold guifg=#73daca guibg=NONE ctermfg=80 ctermbg=NONE
hi LightspeedLabelDistantOverlapped gui=underline term=underline cterm=underline guifg=#41a6b5 guibg=NONE ctermfg=73 ctermbg=NONE
hi LightspeedLabelOverlapped gui=underline term=underline cterm=underline guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi LightspeedMaskedChar gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi LightspeedOneCharMatch gui=bold term=bold cterm=bold guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi LightspeedPendingOpArea gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi LightspeedShortcut gui=underline,bold term=underline,bold cterm=underline,bold guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi LightspeedUnlabeledMatch gui=bold term=bold cterm=bold guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi CmpGhostText gui=NONE term=NONE cterm=NONE guifg=#414868 guibg=NONE ctermfg=238 ctermbg=NONE
hi CmpItemKindCodeium gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi CmpItemKindTabNine gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi CodeBlock gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi AerialNormal gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=NONE ctermfg=251 ctermbg=NONE
hi AerialGuide gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=NONE ctermfg=238 ctermbg=NONE
hi link AerialLine LspInlayHint
hi ScrollbarHandle gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#292e42 ctermfg=NONE ctermbg=236
hi ScrollbarSearchHandle gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=#292e42 ctermfg=215 ctermbg=236
hi ScrollbarSearch gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi ScrollbarErrorHandle gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=#292e42 ctermfg=167 ctermbg=236
hi ScrollbarError gui=NONE term=NONE cterm=NONE guifg=#db4b4b guibg=NONE ctermfg=167 ctermbg=NONE
hi ScrollbarWarnHandle gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#292e42 ctermfg=179 ctermbg=236
hi ScrollbarWarn gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi ScrollbarInfoHandle gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=#292e42 ctermfg=38 ctermbg=236
hi ScrollbarInfo gui=NONE term=NONE cterm=NONE guifg=#0db9d7 guibg=NONE ctermfg=38 ctermbg=NONE
hi ScrollbarHintHandle gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=#292e42 ctermfg=37 ctermbg=236
hi ScrollbarHint gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi ScrollbarMiscHandle gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=#292e42 ctermfg=140 ctermbg=236
hi ScrollbarMisc gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi link YankyPut IncSearch
hi link YankyYanked IncSearch
hi NotifyERRORBody gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi NotifyWARNBody gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi NotifyINFOBody gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi NotifyDEBUGBody gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi NotifyTRACEBody gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#1a1b26 ctermfg=251 ctermbg=234
hi MiniIndentscopeSymbol gui=NONE term=NONE cterm=NONE guifg=#2ac3de guibg=NONE ctermfg=38 ctermbg=NONE
hi clear MiniIndentscopePrefix
hi MiniJump gui=NONE term=NONE cterm=NONE guifg=#ffffff guibg=#ff007c ctermfg=15 ctermbg=198
hi MiniJump2dSpot gui=bold term=bold cterm=bold guifg=#ff007c guibg=NONE ctermfg=198 ctermbg=NONE
hi MiniTablineCurrent gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#3b4261 ctermfg=251 ctermbg=238
hi MiniTablineFill gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#15161e ctermfg=NONE ctermbg=233
hi MiniTablineHidden gui=NONE term=NONE cterm=NONE guifg=#737aa2 guibg=#16161e ctermfg=243 ctermbg=233
hi MiniTablineModifiedCurrent gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#3b4261 ctermfg=179 ctermbg=238
hi MiniTablineModifiedHidden gui=NONE term=NONE cterm=NONE guifg=#a58354 guibg=#16161e ctermfg=137 ctermbg=233
hi MiniTablineModifiedVisible gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=#16161e ctermfg=179 ctermbg=233
hi MiniTablineTabpagesection gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161e ctermfg=NONE ctermbg=233
hi MiniTablineVisible gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi MiniTestEmphasis gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MiniTestFail gui=bold term=bold cterm=bold guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi MiniTestPass gui=bold term=bold cterm=bold guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi MiniTrailspace gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#f7768e ctermfg=NONE ctermbg=210
hi NoiceCompletionItemKindDefault gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi link Headline Headline1
hi Foo gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#ff007c ctermfg=251 ctermbg=198
hi link LspKindBoolean Constant
hi link NoiceCompletionItemKindValue String
hi link LspKindValue String
hi link AerialValueIcon String
hi link NavicIconsValue String
hi link NoiceCompletionItemKindNumber Constant
hi link LspKindNumber Constant
hi link CmpItemKindNumber Constant
hi link AerialNumberIcon Constant
hi link NoiceCompletionItemKindConstant Constant
hi link LspKindConstant Constant
hi link AerialConstantIcon Constant
hi rainbowcol6 gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi rainbowcol5 gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi rainbowcol4 gui=NONE term=NONE cterm=NONE guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi rainbowcol3 gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi rainbowcol2 gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi NormalSB gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=#16161e ctermfg=146 ctermbg=233
hi htmlH1 gui=bold term=bold cterm=bold guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi htmlH2 gui=bold term=bold cterm=bold guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi mkdCodeDelimiter gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#414868 ctermfg=251 ctermbg=238
hi mkdCodeStart gui=bold term=bold cterm=bold guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi mkdCodeEnd gui=bold term=bold cterm=bold guifg=#1abc9c guibg=NONE ctermfg=37 ctermbg=NONE
hi markdownHeadingDelimiter gui=bold term=bold cterm=bold guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi markdownH1 gui=bold term=bold cterm=bold guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi markdownH2 gui=bold term=bold cterm=bold guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi markdownLinkText gui=underline term=underline cterm=underline guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi helpCommand gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=#414868 ctermfg=111 ctermbg=238
hi rainbowcol7 gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi TSRainbowRed gui=NONE term=NONE cterm=NONE guifg=#f7768e guibg=NONE ctermfg=210 ctermbg=NONE
hi TSRainbowYellow gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi TSRainbowGreen gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi TSRainbowViolet gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi TSRainbowCyan gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi RainbowDelimiterOrange gui=NONE term=NONE cterm=NONE guifg=#ff9e64 guibg=NONE ctermfg=215 ctermbg=NONE
hi RainbowDelimiterYellow gui=NONE term=NONE cterm=NONE guifg=#e0af68 guibg=NONE ctermfg=179 ctermbg=NONE
hi RainbowDelimiterGreen gui=NONE term=NONE cterm=NONE guifg=#9ece6a guibg=NONE ctermfg=149 ctermbg=NONE
hi RainbowDelimiterViolet gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi RainbowDelimiterCyan gui=NONE term=NONE cterm=NONE guifg=#7dcfff guibg=NONE ctermfg=117 ctermbg=NONE
hi TroubleText gui=NONE term=NONE cterm=NONE guifg=#a9b1d6 guibg=NONE ctermfg=146 ctermbg=NONE
hi TroubleNormal gui=NONE term=NONE cterm=NONE guifg=#c0caf5 guibg=#16161e ctermfg=251 ctermbg=233
hi illuminatedCurWord gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi IlluminatedWordText gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi IlluminatedWordRead gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi IlluminatedWordWrite gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#3b4261 ctermfg=NONE ctermbg=238
hi diffFile gui=NONE term=NONE cterm=NONE guifg=#7aa2f7 guibg=NONE ctermfg=111 ctermbg=NONE
hi diffLine gui=NONE term=NONE cterm=NONE guifg=#565f89 guibg=NONE ctermfg=60 ctermbg=NONE
hi diffIndexLine gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi NeogitBranch gui=NONE term=NONE cterm=NONE guifg=#bb9af7 guibg=NONE ctermfg=141 ctermbg=NONE
hi NeogitRemote gui=NONE term=NONE cterm=NONE guifg=#9d7cd8 guibg=NONE ctermfg=140 ctermbg=NONE
hi SignColumnSB gui=NONE term=NONE cterm=NONE guifg=#3b4261 guibg=#16161e ctermfg=238 ctermbg=233
hi link AerialBooleanIcon Constant
hi link CmpItemKindBoolean Constant
hi link NoiceCompletionItemKindBoolean Constant
hi Headline2 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#242229 ctermfg=NONE ctermbg=235
hi Headline3 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#212429 ctermfg=NONE ctermbg=235
hi GitGutterAdd gui=NONE term=NONE cterm=NONE guifg=#266d6a guibg=NONE ctermfg=23 ctermbg=NONE
hi Headline4 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#1a232c ctermfg=NONE ctermbg=235
hi Headline5 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#222130 ctermfg=NONE ctermbg=235
hi Headline6 gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#21202f ctermfg=NONE ctermbg=234
hi GitGutterChange gui=NONE term=NONE cterm=NONE guifg=#536c9e guibg=NONE ctermfg=61 ctermbg=NONE
hi GitGutterDelete gui=NONE term=NONE cterm=NONE guifg=#b2555b guibg=NONE ctermfg=131 ctermbg=NONE
