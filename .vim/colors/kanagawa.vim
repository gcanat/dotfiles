set background=dark
hi clear

let g:colors_name = "kanagawa"

hi SpecialKey gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi EndOfBuffer gui=NONE term=NONE cterm=NONE guifg=#1f1f28 guibg=NONE ctermfg=234 ctermbg=NONE
hi TermCursor gui=reverse,inverse term=reverse,inverse cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi clear TermCursorNC
hi NonText gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi Directory gui=NONE term=NONE cterm=NONE guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi ErrorMsg gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi IncSearch gui=NONE term=NONE cterm=NONE guifg=#223249 guibg=#ff9e3b ctermfg=236 ctermbg=215
hi Search gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#2d4f67 ctermfg=187 ctermbg=238
hi CurSearch gui=bold term=bold cterm=bold guifg=#dcd7ba guibg=#2d4f67 ctermfg=187 ctermbg=238
hi MoreMsg gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi ModeMsg gui=bold term=bold cterm=bold guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi LineNr gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr
hi CursorLineNr gui=bold term=bold cterm=bold guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi link CursorLineSign SignColumn
hi link CursorLineFold FoldColumn
hi link Question MoreMsg
hi StatusLine gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi StatusLineNC gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi WinSeparator gui=NONE term=NONE cterm=NONE guifg=#16161d guibg=#54546d
hi VertSplit gui=NONE term=NONE guifg=#16161d guibg=#54546d
hi Title gui=bold term=bold cterm=bold guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi Visual gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#223249 ctermfg=NONE ctermbg=236
hi clear VisualNC
hi WarningMsg gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi link WildMenu Pmenu
hi Folded gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=#2a2a37 ctermfg=103 ctermbg=235
hi FoldColumn gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi DiffAdd gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2b3328 ctermfg=NONE ctermbg=236
hi DiffChange gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#252535 ctermfg=NONE ctermbg=235
hi DiffDelete gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=#43242b ctermfg=131 ctermbg=235
hi DiffText gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#49443c ctermfg=NONE ctermbg=238
hi SignColumn gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi Conceal gui=bold term=bold cterm=bold guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi SpellBad gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#e82424
hi SpellCap gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff9e3b
hi SpellRare gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff9e3b
hi SpellLocal gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff9e3b
hi Pmenu gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#223249 ctermfg=187 ctermbg=236
hi PmenuSel gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2d4f67 ctermfg=NONE ctermbg=238
hi link PmenuKind Pmenu
hi link PmenuKindSel PmenuSel
hi link PmenuExtra Pmenu
hi link PmenuExtraSel PmenuSel
hi PmenuMatch guifg=#ffaf5f guibg=#223249 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#ffaf5f guibg=#2d4f67 gui=NONE cterm=NONE
hi PmenuSbar gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#223249 ctermfg=NONE ctermbg=236
hi PmenuThumb gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2d4f67 ctermfg=NONE ctermbg=238
hi TabLine gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=#16161d ctermfg=103 ctermbg=233
hi TabLineSel gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#2a2a37 ctermfg=7 ctermbg=235
hi TabLineFill gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#1f1f28 ctermfg=NONE ctermbg=234
hi link CursorColumn CursorLine
hi CursorLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#363646 ctermfg=NONE ctermbg=237
hi ColorColumn gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2a2a37 ctermfg=NONE ctermbg=235
hi QuickFixLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2a2a37 ctermfg=NONE ctermbg=235
hi Whitespace gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi link NormalNC Normal
hi MsgSeparator gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#16161d ctermfg=NONE ctermbg=233
hi NormalFloat gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi MsgArea gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=NONE ctermfg=7 ctermbg=NONE
hi FloatBorder gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi WinBar gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=NONE ctermfg=7 ctermbg=NONE
hi WinBarNC gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=NONE ctermfg=7 ctermbg=NONE
hi Cursor gui=NONE term=NONE cterm=NONE guifg=#1f1f28 guibg=#dcd7ba ctermfg=234 ctermbg=187
hi FloatTitle gui=bold term=bold cterm=bold guifg=#938aa9 guibg=#16161d ctermfg=103 ctermbg=233
hi link lCursor Cursor
" hi Normal gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#1f1f28 ctermfg=NONE ctermbg=NONE
" hi Normal gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=NONE ctermfg=NONE ctermbg=NONE
hi Normal gui=NONE term=NONE cterm=NONE guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi Substitute gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#c34043 ctermfg=187 ctermbg=131
hi FloatShadow gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#000000 ctermfg=NONE ctermbg=0
hi FloatShadowThrough gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#000000 ctermfg=NONE ctermbg=0
hi RedrawDebugNormal gui=reverse,inverse term=reverse,inverse cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi RedrawDebugClear gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#ffff00 ctermfg=NONE ctermbg=11
hi RedrawDebugComposed gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#008000 ctermfg=NONE ctermbg=2
hi RedrawDebugRecompose gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#ff0000 ctermfg=NONE ctermbg=9
hi Error gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi Todo gui=bold term=bold cterm=bold guifg=#223249 guibg=#658594 ctermfg=236 ctermbg=66
hi String gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi Constant gui=NONE term=NONE cterm=NONE guifg=#ffa066 guibg=NONE ctermfg=215 ctermbg=NONE
hi link Character String
hi Number gui=NONE term=NONE cterm=NONE guifg=#d27e99 guibg=NONE ctermfg=174 ctermbg=NONE
hi Boolean gui=bold term=bold cterm=bold guifg=#ffa066 guibg=NONE ctermfg=215 ctermbg=NONE
hi link Float Number
hi Function gui=NONE term=NONE cterm=NONE guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi Identifier gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi link Conditional Statement
hi Statement gui=bold term=bold cterm=bold guifg=#957fb8 guibg=NONE ctermfg=103 ctermbg=NONE
hi link Repeat Statement
hi link Label Statement
hi Operator gui=NONE term=NONE cterm=NONE guifg=#c0a36e guibg=NONE ctermfg=143 ctermbg=NONE
hi Keyword gui=italic term=italic cterm=italic guifg=#957fb8 guibg=NONE ctermfg=103 ctermbg=NONE
hi Exception gui=NONE term=NONE cterm=NONE guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi link Include PreProc
hi PreProc gui=NONE term=NONE cterm=NONE guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi Type gui=NONE term=NONE cterm=NONE guifg=#7aa89f guibg=NONE ctermfg=109 ctermbg=NONE
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi Special gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi link SpecialChar Special
hi Delimiter gui=NONE term=NONE cterm=NONE guifg=#9cabca guibg=NONE ctermfg=248 ctermbg=NONE
hi link SpecialComment Special
hi link Debug Special
hi DiagnosticError gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi DiagnosticWarn gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi DiagnosticInfo gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi DiagnosticHint gui=NONE term=NONE cterm=NONE guifg=#6a9589 guibg=NONE ctermfg=66 ctermbg=NONE
hi DiagnosticOk gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi DiagnosticUnderlineError gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#e82424
hi DiagnosticUnderlineWarn gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff9e3b
hi DiagnosticUnderlineInfo gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#658594
hi DiagnosticUnderlineHint gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#6a9589
hi DiagnosticUnderlineOk gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#90ee90
hi link DiagnosticVirtualTextError DiagnosticError
hi link DiagnosticVirtualTextWarn DiagnosticWarn
hi link DiagnosticVirtualTextInfo DiagnosticInfo
hi link DiagnosticVirtualTextHint DiagnosticHint
hi link DiagnosticVirtualTextOk DiagnosticOk
hi link DiagnosticFloatingError DiagnosticError
hi link DiagnosticFloatingWarn DiagnosticWarn
hi link DiagnosticFloatingInfo DiagnosticInfo
hi link DiagnosticFloatingHint DiagnosticHint
hi link DiagnosticFloatingOk DiagnosticOk
hi DiagnosticSignError gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi DiagnosticSignWarn gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi DiagnosticSignInfo gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi DiagnosticSignHint gui=NONE term=NONE cterm=NONE guifg=#6a9589 guibg=NONE ctermfg=66 ctermbg=NONE
hi link DiagnosticSignOk DiagnosticOk
hi DiagnosticDeprecated gui=NONE term=NONE cterm=NONE guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ff0000
hi link DiagnosticUnnecessary Comment
hi Comment gui=italic term=italic cterm=italic guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi Underlined gui=underline term=underline cterm=underline guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi MatchParen gui=bold term=bold cterm=bold guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi link Ignore NonText
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
hi link NvimParenthesis Delimiter
hi link NvimLambda Delimiter
hi link NvimNestingParenthesis Delimiter
hi link NvimCallingParenthesis Delimiter
hi link NvimSubscript Delimiter
hi link NvimSubscriptBracket Delimiter
hi link NvimSubscriptColon Delimiter
hi link NvimCurly Delimiter
hi link NvimContainer Delimiter
hi link NvimDict Delimiter
hi link NvimList Delimiter
hi link NvimIdentifier Identifier
hi link NvimIdentifierScope Identifier
hi link NvimIdentifierScopeDelimiter Identifier
hi link NvimIdentifierName Identifier
hi link NvimIdentifierKey Identifier
hi link NvimColon Delimiter
hi link NvimComma Delimiter
hi link NvimArrow Delimiter
hi link NvimRegister Special
hi link NvimNumber Number
hi link NvimFloat Number
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
hi Bold gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link CmpCompletion Pmenu
hi CmpCompletionBorder gui=NONE term=NONE cterm=NONE guifg=#2d4f67 guibg=#223249 ctermfg=238 ctermbg=236
hi link CmpCompletionSbar PmenuSbar
hi CmpCompletionSel gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2d4f67 ctermfg=NONE ctermbg=238
hi link CmpCompletionThumb PmenuThumb
hi link CmpDocumentation NormalFloat
hi link CmpDocumentationBorder FloatBorder
hi CmpItemAbbr gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=NONE ctermfg=187 ctermbg=NONE
hi CmpItemAbbrDeprecated gui=NONE term=NONE cterm=NONE guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi CmpItemAbbrMatch gui=NONE term=NONE cterm=NONE guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
hi link CmpItemKindClass Type
hi link CmpItemKindConstant Constant
hi link CmpItemKindCopilot String
hi CmpItemKindDefault gui=NONE term=NONE cterm=NONE guifg=#717c7c guibg=NONE ctermfg=243 ctermbg=NONE
hi link CmpItemKindEnum Type
hi link CmpItemKindEnumMember Constant
hi link CmpItemKindField Identifier
hi link CmpItemKindFile Directory
hi link CmpItemKindFolder Directory
hi link CmpItemKindFunction Function
hi link CmpItemKindInterface Type
hi link CmpItemKindKeyword Keyword
hi link CmpItemKindMethod Function
hi link CmpItemKindModule PreProc
hi link CmpItemKindOperator Operator
hi link CmpItemKindProperty Identifier
hi link CmpItemKindReference Type
hi CmpItemKindSnippet gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi link CmpItemKindStruct Type
hi CmpItemKindText gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=NONE ctermfg=187 ctermbg=NONE
hi link CmpItemKindTypeParameter Type
hi link CmpItemKindValue String
hi CmpItemKindVariable gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=NONE ctermfg=7 ctermbg=NONE
hi CmpItemMenu gui=NONE term=NONE cterm=NONE guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi link CursorIM Cursor
hi DapUIBreakpointsCurrentLine gui=bold term=bold cterm=bold guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi link DapUIBreakpointsDisabledLine Comment
hi DapUIBreakpointsInfo gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi link DapUIBreakpointsPath Directory
hi DapUIDecoration gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi DapUIFloatBorder gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi DapUILineNumber gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIModifiedValue gui=bold term=bold cterm=bold guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIPlayPause gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi DapUIRestart gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi link DapUIScope Special
hi DapUISource gui=NONE term=NONE cterm=NONE guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi DapUIStepBack gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIStepInto gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIStepOut gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIStepOver gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIStop gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi DapUIStoppedThread gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DapUIThread gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi link DapUIType Type
hi DapUIUnavailable gui=NONE term=NONE cterm=NONE guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi DapUIWatchesEmpty gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi DapUIWatchesError gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi DapUIWatchesValue gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi DashboardCenter gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi DashboardDesc gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi DashboardFooter gui=NONE term=NONE cterm=NONE guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi DashboardHeader gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi DashboardIcon gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi DashboardKey gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi DashboardShortCut gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi FloatFooter gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi FloatermBorder gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#1f1f28 ctermfg=240 ctermbg=234
hi GitSignsAdd gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi GitSignsChange gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi GitSignsDelete gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi IblIndent gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi IblScope gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi IblWhitespace gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi IndentBlanklineChar gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi IndentBlanklineContextChar gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi IndentBlanklineContextStart gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#938aa9
hi IndentBlanklineSpaceChar gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi IndentBlanklineSpaceCharBlankline gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi Italic gui=italic term=italic cterm=italic guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi LazyButton gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#363646 ctermfg=NONE ctermbg=237
hi LazyButtonActive gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#223249 ctermfg=NONE ctermbg=236
hi LazyComment gui=italic term=italic cterm=italic guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi LazyCommit gui=italic term=italic cterm=italic guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi LazyCommitIssue gui=NONE term=NONE cterm=NONE guifg=#d27e99 guibg=NONE ctermfg=174 ctermbg=NONE
hi LazyCommitScope gui=italic term=italic cterm=italic guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi LazyCommitType gui=bold term=bold cterm=bold guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi LazyDimmed gui=bold term=bold cterm=bold guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi LazyDir gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi LazyH1 gui=NONE term=NONE cterm=NONE guifg=#223249 guibg=#ff9e3b ctermfg=236 ctermbg=215
hi LazyH2 gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi LazyLocal gui=NONE term=NONE cterm=NONE guifg=#ffa066 guibg=NONE ctermfg=215 ctermbg=NONE
hi LazyNoCond gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi LazyNormal gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi LazyProgressDone gui=NONE term=NONE cterm=NONE guifg=#ffa066 guibg=NONE ctermfg=215 ctermbg=NONE
hi LazyProgressTodo gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=NONE ctermfg=240 ctermbg=NONE
hi LazyProp gui=bold term=bold cterm=bold guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi LazyReasonCmd gui=NONE term=NONE cterm=NONE guifg=#c0a36e guibg=NONE ctermfg=143 ctermbg=NONE
hi LazyReasonEvent gui=NONE term=NONE cterm=NONE guifg=#ffa066 guibg=NONE ctermfg=215 ctermbg=NONE
hi LazyReasonFt gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi LazyReasonImport gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi LazyReasonKeys gui=bold term=bold cterm=bold guifg=#957fb8 guibg=NONE ctermfg=103 ctermbg=NONE
hi LazyReasonPlugin gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi LazyReasonRequire gui=NONE term=NONE cterm=NONE guifg=#b8b4d0 guibg=NONE ctermfg=249 ctermbg=NONE
hi LazyReasonRuntime gui=NONE term=NONE cterm=NONE guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi LazyReasonSource gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi LazyReasonStart gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi LazySpecial gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi LazyTaskError gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi LazyTaskOutput gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=NONE ctermfg=7 ctermbg=NONE
hi LazyUrl gui=NONE term=NONE cterm=NONE guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi LazyValue gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi LspCodeLens gui=NONE term=NONE cterm=NONE guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi link LspReferenceRead LspReferenceText
hi LspReferenceText gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#49443c ctermfg=NONE ctermbg=238
hi LspReferenceWrite gui=underline term=underline cterm=underline guifg=NONE guibg=#49443c ctermfg=NONE ctermbg=238
hi LspSignatureActiveParameter gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi MiniClueBorder gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi MiniClueDescGroup gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi MiniClueDescSingle gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi MiniClueNextKey gui=NONE term=NONE cterm=NONE guifg=#6a9589 guibg=NONE ctermfg=66 ctermbg=NONE
hi MiniClueNextKeyWithPostkeys gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi MiniClueSeparator gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi MiniClueTitle gui=bold term=bold cterm=bold guifg=#938aa9 guibg=#16161d ctermfg=103 ctermbg=233
hi MiniCompletionActiveParameter gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MiniCursorword gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MiniCursorwordCurrent gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi MiniStarterCurrent gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#1f1f28 ctermfg=187 ctermbg=234
hi MiniStarterFooter gui=bold term=bold cterm=bold guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi MiniStarterHeader gui=bold term=bold cterm=bold guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi MiniStarterInactive gui=italic term=italic cterm=italic guifg=#727169 guibg=NONE ctermfg=242 ctermbg=NONE
hi MiniStarterItem gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=#1f1f28 ctermfg=187 ctermbg=234
hi MiniStarterItemBullet gui=NONE term=NONE cterm=NONE guifg=#9cabca guibg=NONE ctermfg=248 ctermbg=NONE
hi MiniStarterItemPrefix gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi MiniStarterQuery gui=NONE term=NONE cterm=NONE guifg=#658594 guibg=NONE ctermfg=66 ctermbg=NONE
hi MiniStarterSection gui=NONE term=NONE cterm=NONE guifg=#9cabca guibg=NONE ctermfg=248 ctermbg=NONE
hi MiniStatuslineDevinfo gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi MiniStatuslineFileinfo gui=NONE term=NONE cterm=NONE guifg=#c8c093 guibg=#16161d ctermfg=7 ctermbg=233
hi MiniStatuslineFilename gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi MiniStatuslineInactive gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#16161d ctermfg=240 ctermbg=233
hi MiniStatuslineModeCommand gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#49443c ctermfg=NONE ctermbg=238
hi MiniStatuslineModeInsert gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#252535 ctermfg=NONE ctermbg=235
hi MiniStatuslineModeNormal gui=NONE term=NONE cterm=NONE guifg=#1f1f28 guibg=#dcd7ba ctermfg=234 ctermbg=187
hi MiniStatuslineModeOther gui=NONE term=NONE cterm=NONE guifg=#223249 guibg=#ff9e3b ctermfg=236 ctermbg=215
hi MiniStatuslineModeReplace gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=#43242b ctermfg=131 ctermbg=235
hi MiniStatuslineModeVisual gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2b3328 ctermfg=NONE ctermbg=236
hi MiniSurround gui=NONE term=NONE cterm=NONE guifg=#223249 guibg=#ff9e3b ctermfg=236 ctermbg=215
hi link NavicIconsArray Type
hi link NavicIconsBoolean Boolean
hi link NavicIconsClass Type
hi link NavicIconsConstant Constant

hi link NavicIconsEnum Identifier
hi link NavicIconsEnumMember TSField
hi clear TSField
hi link NavicIconsEvent Type
hi link NavicIconsField TSField
hi link NavicIconsFile Directory
hi link NavicIconsFunction Function
hi link NavicIconsInterface Type
hi link NavicIconsKey Keyword
hi link NavicIconsMethod Function
hi link NavicIconsModule TSInclude
hi clear TSInclude
hi link NavicIconsNamespace TSInclude
hi link NavicIconsNull Type
hi link NavicIconsNumber Number
hi link NavicIconsObject Type
hi link NavicIconsOperator Operator
hi link NavicIconsPackage TSInclude
hi link NavicIconsProperty TSProperty
hi clear TSProperty
hi link NavicIconsString String
hi link NavicIconsStruct Type
hi link NavicIconsTypeParameter Identifier

hi NavicSeparator gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=NONE ctermfg=187 ctermbg=NONE
hi NavicText gui=NONE term=NONE cterm=NONE guifg=#dcd7ba guibg=NONE ctermfg=187 ctermbg=NONE
hi NeoTreeGitAdded gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi NeoTreeGitConflict gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi NeoTreeGitDeleted gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi NeoTreeGitModified gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi NeoTreeGitStaged gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi NeoTreeGitUnstaged gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi NeoTreeGitUntracked gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi link NeoTreeIndentMarker NonText
hi link NeoTreeModified String
hi NeoTreeRootName gui=bold term=bold cterm=bold guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi link NeoTreeTabActive TabLineSel
hi link NeoTreeTabInactive TabLine
hi link NeoTreeTabSeparatorActive TabLineSel
hi link NeoTreeTabSeparatorInactive TabLine
hi NeogitDiffAddHighlight gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2b3328 ctermfg=NONE ctermbg=236
hi NeogitDiffContextHighlight gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#252535 ctermfg=NONE ctermbg=235
hi NeogitDiffDeleteHighlight gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#43242b ctermfg=NONE ctermbg=235
hi NeogitHunkHeader gui=NONE term=NONE cterm=NONE guifg=#7e9cd8 guibg=NONE ctermfg=246 ctermbg=NONE
hi NeogitHunkHeaderHighlight gui=NONE term=NONE cterm=NONE guifg=#ffa066 guibg=#252535 ctermfg=215 ctermbg=235
hi NotifyBackground gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#1f1f28 ctermfg=NONE ctermbg=234
hi link NotifyDEBUGBorder Special
hi link NotifyDEBUGIcon Special
hi link NotifyDEBUGTitle Special
hi link NotifyERRORBorder DiagnosticError
hi link NotifyERRORIcon DiagnosticError
hi link NotifyERRORTitle DiagnosticError
hi link NotifyHINTBorder DiagnosticHint
hi link NotifyHINTIcon DiagnosticHint
hi link NotifyHINTTitle DiagnosticHint
hi link NotifyINFOBorder DiagnosticInfo
hi link NotifyINFOIcon DiagnosticInfo
hi link NotifyINFOTitle DiagnosticInfo
hi link NotifyTRACEBorder Comment
hi link NotifyTRACEIcon Comment
hi link NotifyTRACETitle Comment
hi link NotifyWARNBorder DiagnosticWarn
hi link NotifyWARNIcon DiagnosticWarn
hi link NotifyWARNTitle DiagnosticWarn
hi NvimTreeExecFile gui=bold term=bold cterm=bold guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi link NvimTreeFolderName Directory
hi NvimTreeGitDeleted gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi NvimTreeGitDirty gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi NvimTreeGitNew gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi NvimTreeGitStaged gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi NvimTreeImageFile gui=NONE term=NONE cterm=NONE guifg=#e46876 guibg=NONE ctermfg=168 ctermbg=NONE
hi link NvimTreeNormal Normal
hi link NvimTreeNormalNC Normal
hi NvimTreeOpenedFile gui=italic term=italic cterm=italic guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi NvimTreeRootFolder gui=bold term=bold cterm=bold guifg=#e6c384 guibg=NONE ctermfg=251 ctermbg=NONE
hi NvimTreeSpecialFile gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi link NvimTreeSymlink Type
hi link NvimTreeWinSeparator WinSeparator
hi NvimTreeWindowPicker gui=bold term=bold cterm=bold guifg=#7fb4ca guibg=#1a1a22 ctermfg=110 ctermbg=234
hi TelescopeBorder gui=NONE term=NONE cterm=NONE guifg=#54546d guibg=#1f1f28 ctermfg=240 ctermbg=234
hi link TelescopeResultsClass Type
hi link TelescopeResultsField Identifier
hi link TelescopeResultsMethod Function
hi link TelescopeResultsStruct Type

hi link TelescopeSelection CursorLine
hi link TelescopeSelectionCaret CursorLineNr
hi TelescopeTitle gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi link TreesitterContext Folded
hi TreesitterContextLineNumber gui=NONE term=NONE cterm=NONE guifg=#938aa9 guibg=NONE ctermfg=103 ctermbg=NONE
hi link VisualNOS Visual
hi debugBreakpoint gui=NONE term=NONE cterm=NONE guifg=#7fb4ca guibg=NONE ctermfg=110 ctermbg=NONE
hi debugPC gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#43242b ctermfg=NONE ctermbg=235
hi diffAdded gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi diffChanged gui=NONE term=NONE cterm=NONE guifg=#dca561 guibg=NONE ctermfg=179 ctermbg=NONE
hi diffDeleted gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi diffNewFile gui=NONE term=NONE cterm=NONE guifg=#76946a guibg=NONE ctermfg=245 ctermbg=NONE
hi diffOldFile gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi diffRemoved gui=NONE term=NONE cterm=NONE guifg=#c34043 guibg=NONE ctermfg=131 ctermbg=NONE
hi healthError gui=NONE term=NONE cterm=NONE guifg=#e82424 guibg=NONE ctermfg=160 ctermbg=NONE
hi healthSuccess gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi healthWarning gui=NONE term=NONE cterm=NONE guifg=#ff9e3b guibg=NONE ctermfg=215 ctermbg=NONE
hi markdownCode gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi markdownCodeBlock gui=NONE term=NONE cterm=NONE guifg=#98bb6c guibg=NONE ctermfg=107 ctermbg=NONE
hi link qfFileName Directory
hi link qfLineNr LineNr
