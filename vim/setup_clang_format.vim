" http://llvm.org/releases/3.5.0/tools/clang/docs/ClangFormatStyleOptions.html
let g:clang_format#command = 'clang-format-3.5'

let g:clang_format#style_options = {
    \ "BasedOnStyle" :                                    "Google",
    \ "Language" :                                        "Cpp",
    \ "AccessModifierOffset" :                            "-1",
    \ "ConstructorInitializerIndentWidth" :               "4",
    \ "AlignEscapedNewlinesLeft" :                        "true",
    \ "AlignTrailingComments" :                           "true",
    \ "AllowAllParametersOfDeclarationOnNextLine" :       "true",
    \ "AllowShortBlocksOnASingleLine" :                   "false",
    \ "AllowShortIfStatementsOnASingleLine" :             "true",
    \ "AllowShortLoopsOnASingleLine" :                    "true",
    \ "AllowShortFunctionsOnASingleLine" :                "All",
    \ "AlwaysBreakTemplateDeclarations" :                 "true",
    \ "AlwaysBreakBeforeMultilineStrings" :               "true",
    \ "BreakBeforeBinaryOperators" :                      "false",
    \ "BreakBeforeTernaryOperators" :                     "true",
    \ "BinPackParameters" :                               "true",
    \ "ColumnLimit" :                                     "80",
    \ "ConstructorInitializerAllOnOneLineOrOnePerLine" :  "true",
    \ "DerivePointerAlignment" :                          "true",
    \ "ExperimentalAutoDetectBinPacking" :                "false",
    \ "IndentCaseLabels" :                                "true",
    \ "IndentWrappedFunctionNames" :                      "false",
    \ "IndentFunctionDeclarationAfterType" :              "false",
    \ "MaxEmptyLinesToKeep" :                             "1",
    \ "KeepEmptyLinesAtTheStartOfBlocks" :                "false",
    \ "NamespaceIndentation" :                            "None",
    \ "ObjCSpaceAfterProperty" :                          "false",
    \ "ObjCSpaceBeforeProtocolList" :                     "false",
    \ "PenaltyBreakBeforeFirstCallParameter" :            "1",
    \ "PenaltyBreakComment" :                             "300",
    \ "PenaltyBreakString" :                              "1000",
    \ "PenaltyBreakFirstLessLess" :                       "120",
    \ "PenaltyExcessCharacter" :                          "1000000",
    \ "PointerAlignment" :                                "Left",
    \ "SpacesBeforeTrailingComments" :                    "2",
    \ "Cpp11BracedListStyle" :                            "true",
    \ "Standard" :                                        "Auto",
    \ "IndentWidth" :                                     "2",
    \ "UseTab" :                                          "Never",
    \ "BreakBeforeBraces" :                               "Attach",
    \ "SpacesInAngles" :                                  "false",
    \ "SpaceInEmptyParentheses" :                         "false",
    \ "SpacesInCStyleCastParentheses" :                   "false",
    \ "SpacesInContainerLiterals" :                       "true",
    \ "SpaceBeforeAssignmentOperators" :                  "true",
    \ "ContinuationIndentWidth" :                         "4",
    \ "CommentPragmas" :                                  "'^ IWYU pragma:'",
    \ "ForEachMacros" :                                   "[ foreach, Q_FOREACH, BOOST_FOREACH ]",
    \ "SpaceBeforeParens" :                               "ControlStatements",
    \ "DisableFormat" :                                   "false",
    \ "TabWidth" :                                        "4",
    \ "SpacesInParentheses" :                             "true",
    \ }

let g:clang_format#style_options = {
    \  "BasedOnStyle"                             :  "Google",
    \  "AllowShortIfStatementsOnASingleLine"      :  "true",
    \  "AlwaysBreakTemplateDeclarations"          :  "true",
    \  "Standard"                                 :  "C++11",
    \  "SpacesInParentheses"                      :  "true",
    \  "BreakConstructorInitializersBeforeComma"  :  "true",
    \  "BreakBeforeBraces"                        :  "Stroustrup",
    \  "PenaltyReturnTypeOnItsOwnLine"            :  "0",
    \ }

" Desired future style options (not available in Clang 3.5)
" \  "ReturnTypeBreakingStyle" : "RTBS_AllDefinitions",
" \  "BreakConstructorInitializersBeforeComma"  :  "true",

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
