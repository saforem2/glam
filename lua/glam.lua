local M = {}

M.highlight = function(group, options)
    local guifg = options.fg or "NONE"
    local guibg = options.bg or "NONE"
    local guisp = options.sp or "NONE"
    local gui = options.gui or "NONE"
    local blend = options.blend or 0
    local ctermfg = options.ctermfg or "NONE"

    vim.cmd(
        string.format(
            "highlight %s guifg=%s ctermfg=%s guibg=%s guisp=%s gui=%s blend=%d",
            group,
            guifg,
            ctermfg,
            guibg,
            guisp,
            gui,
            blend
        )
    )
end

M.link = function(groupa, groupb)
    vim.cmd(string.format("highlight link %s %s", groupa, groupb))
end

M.colors = {
    red = "#FF4D75",
    dark_red = "#FF2052",
    diff_red = "#2c1517",
    green = "#63FF5B",
    dark_green = "#82FF7C",
    diff_green = "#1e2718",
    yellow = "#FFFF00",
    dark_yellow = "#FFFF7F",
    diff_yellow = "#3e2e1e",
    blue = "#4DABF5",
    dimm_blue = "#2196F3",
    purple = "#FF00FF",
    dimm_purple = "#AE81FF",
    diff_purple = "#27182C",
    cyan = "#00CCFF",
    white = "#38D9A9",
    black = "#1f1f1f",
    dimm_black = "#1c1c1c",
    dark_black = "#1a1a1a",
    comment_grey = "#5C6370",
    gutter_fg_grey = "#4B5263",
    cursor_grey = "#2C323C",
    dimm_cursor_grey = "#21262d",
    dark_cursor_grey = "#1d2228",
    visual_grey = "#3E4452",
    special_grey = "#3B4048",
    bracket_grey = "#7C828C",
}

M.setup = function()
    vim.g.colors_name = "glam"
    -- vim.cmd [[highlight clear]]
    -- vim.cmd [[syntax reset]]

    M.highlight("Comment", { fg = M.colors.comment_grey, gui = "italic,bold" })
    M.highlight("Constant", { fg = M.colors.cyan })
    M.highlight("String", { fg = M.colors.green, gui = "italic" })
    M.highlight("Character", { fg = M.colors.green })
    M.highlight("Number", { fg = M.colors.dark_yellow })
    M.highlight("Boolean", { fg = M.colors.dark_yellow })
    M.highlight("Float", { fg = M.colors.dark_yellow })
    M.highlight("Identifier", { fg = M.colors.red })
    M.highlight("Function", { fg = M.colors.blue })
    M.highlight("Statement", { fg = M.colors.purple })
    M.highlight("Conditional", { fg = M.colors.purple })
    M.highlight("Repeat", { fg = M.colors.purple })
    M.highlight("Label", { fg = M.colors.purple })
    M.highlight("Operator", { fg = M.colors.purple })
    M.highlight("Keyword", { fg = M.colors.red })
    M.highlight("Exception", { fg = M.colors.purple })
    M.highlight("PreProc", { fg = M.colors.yellow })
    M.highlight("Include", { fg = M.colors.blue })
    M.highlight("Define", { fg = M.colors.purple })
    M.highlight("Macro", { fg = M.colors.purple })
    M.highlight("PreCondit", { fg = M.colors.yellow })
    M.highlight("Type", { fg = M.colors.yellow })
    M.highlight("StorageClass", { fg = M.colors.yellow })
    M.highlight("Structure", { fg = M.colors.yellow })
    M.highlight("Typedef", { fg = M.colors.yellow })
    M.highlight("Special", { fg = M.colors.blue })
    M.highlight("SpecialChar", {})
    M.highlight("Tag", { fg = M.colors.red })
    M.highlight("Delimiter", {})
    M.highlight("SpecialComment", { fg = M.colors.comment_grey, gui = "italic" })
    M.highlight("Debug", {})
    M.highlight("Underlined", { gui = "underline" })
    M.highlight("Bold", { gui = "bold" })
    M.highlight("CursorWord0", { gui = "bold" })
    M.highlight("CursorWord1", { gui = "bold" })
    M.highlight("Ignore", {})
    M.highlight("Error", { fg = M.colors.dark_red })
    M.highlight("Todo", { fg = M.colors.purple, gui = "bold" })
    M.highlight("@text.fixme.comment", { fg = M.colors.dark_yellow, gui = "bold" })

    M.highlight("ColorColumn", {})
    M.highlight("VirtColumn", { fg = M.colors.dark_black })
    M.highlight("Conceal", { fg = M.colors.red })
    M.highlight("Cursor", { fg = M.colors.black, bg = M.colors.green })
    M.highlight("LspCodeLens", { fg = M.colors.bracket_grey })
    M.highlight("LspCodeLensSeparator", { fg = M.colors.bracket_grey })
    M.highlight("LspInlayHint", { fg = M.colors.visual_grey, gui = "bold,italic" })
    M.highlight("LSPDeprecated", { fg = M.colors.comment_grey, gui = "strikethrough" })
    M.highlight("CursorIM", {})
    M.highlight("CursorColumn", { bg = M.colors.dark_black })
    M.highlight("CursorLine", { bg = M.colors.dark_black })
    M.highlight("Directory", { fg = M.colors.blue })
    M.highlight("DiffAdd", { bg = M.colors.diff_green })
    M.highlight("DiffChange", { bg = M.colors.diff_yellow })
    M.highlight("DiffDelete", { fg = M.colors.cursor_grey })
    M.highlight("DiffDeleteOld", { bg = M.colors.diff_red })
    M.highlight("DiffText", { bg = M.colors.diff_yellow })
    M.highlight("ErrorMsg", { fg = M.colors.red })
    M.highlight("VertSplit", { fg = M.colors.dark_black, bg = M.colors.dark_black })
    M.highlight("Folded", { fg = M.colors.comment_grey, bg = M.colors.dimm_cursor_grey })
    M.highlight("FoldColumn", { fg = M.colors.yellow })
    M.highlight("SignColumn", {})
    M.highlight("IncSearch", { fg = M.colors.comment_grey, bg = M.colors.green })

    M.highlight("LineNr", { fg = M.colors.gutter_fg_grey })
    M.highlight("CursorLineNr", { fg = M.colors.green })
    M.highlight("MatchParen", { fg = M.colors.blue, gui = "underline" })
    M.highlight("ModeMsg", {})
    M.highlight("MoreMsg", {})
    M.highlight("NonText", { fg = M.colors.special_grey })
    M.highlight("Normal", { fg = M.colors.white })
    M.highlight("NormalFloat", { fg = M.colors.white })
    M.highlight("Pmenu", { bg = M.colors.dark_black, blend = 10 })
    M.highlight("PmenuSel", { fg = M.colors.black, bg = M.colors.green })
    M.highlight("PmenuSbar", { bg = M.colors.special_grey })
    M.highlight("PmenuThumb", { bg = M.colors.white })
    M.highlight("Question", { fg = M.colors.purple })
    M.highlight("Search", { fg = M.colors.black, bg = M.colors.comment_grey })
    M.highlight("ESearchMatch", { fg = M.colors.black, bg = M.colors.comment_grey })
    M.highlight("QuickFixLine", { gui = "bold" })
    M.highlight("SpecialKey", { fg = M.colors.special_grey })
    M.highlight("SpellBad", { gui = "undercurl", sp = M.colors.red })
    M.highlight("SpellCap", { gui = "undercurl", sp = M.colors.special_grey })
    M.highlight("SpellLocal", { gui = "undercurl", sp = M.colors.special_grey })
    M.highlight("SpellRare", { gui = "undercurl", sp = M.colors.special_grey })
    M.highlight("StatusLine", { fg = M.colors.white, bg = M.colors.dark_black })
    M.highlight("StatusLineNC", { fg = M.colors.comment_grey, bg = M.colors.dark_black })
    M.highlight("TabLine", { fg = M.colors.comment_grey })
    M.highlight("TabLineFill", {})
    M.highlight("TabLineSel", { fg = M.colors.white })
    M.highlight("Title", { fg = M.colors.green })
    M.highlight("Visual", { fg = M.colors.visual_black, bg = M.colors.visual_grey })
    M.highlight("VisualNOS", { bg = M.colors.visual_grey })
    M.highlight("WarningMsg", { fg = M.colors.yellow })
    M.highlight("WildMenu", { fg = M.colors.black, bg = M.colors.blue })
    M.highlight("WinNormalNC", { bg = M.colors.dark_black })
    M.highlight("WinSeparator", { fg = M.colors.black })
    M.highlight("HighlightedyankRegion", { bg = M.colors.comment_grey })

    M.highlight("FlashLabel", { fg = M.colors.black, bg = M.colors.purple, gui = "bold" })

    --- Languages

    -- Markdown
    M.highlight("markdownCode", { fg = M.colors.yellow })
    M.highlight("markdownCodeBlockBGBorder", { bg = M.colors.dark_black })
    M.highlight("markdownCodeBlockBGBorderSign", { fg = M.colors.gutter_fg_grey })
    M.highlight("markdownCodeBlock", { fg = M.colors.yellow })
    M.highlight("markdownCodeDelimiter", { fg = M.colors.cursor_grey })
    M.highlight("markdownHeadingDelimiter", { fg = M.colors.gutter_fg_grey })
    M.highlight("markdownRule", { fg = M.colors.comment_grey })
    M.highlight("markdownHeadingRule", { fg = M.colors.comment_grey })
    M.highlight("@text.title.1.markdown", { bg = M.colors.diff_green, fg = M.colors.green, gui = "bold" })
    M.highlight("@text.title.2.markdown", { bg = M.colors.dimm_cursor_grey, fg = M.colors.blue, gui = "bold" })
    M.highlight("@text.title.3.markdown", { bg = M.colors.diff_red, fg = M.colors.red, gui = "bold" })
    M.highlight("@text.title.4.markdown", { bg = M.colors.diff_purple, fg = M.colors.purple, gui = "bold" })
    M.highlight("@text.title.5.markdown", { bg = M.colors.diff_yellow, fg = M.colors.yellow, gui = "bold" })
    M.highlight("@text.title.6.markdown", { bg = M.colors.diff_green, fg = M.colors.green, gui = "bold" })
    M.highlight("@text.title.1.marker.markdown", { fg = M.colors.green, gui = "bold" })
    M.highlight("@text.title.2.marker.markdown", { fg = M.colors.blue, gui = "bold" })
    M.highlight("@text.title.3.marker.markdown", { fg = M.colors.red, gui = "bold" })
    M.highlight("@text.title.4.marker.markdown", { fg = M.colors.purple, gui = "bold" })
    M.highlight("@text.title.5.marker.markdown", { fg = M.colors.yellow, gui = "bold" })
    M.highlight("@text.title.6.marker.markdown", { fg = M.colors.green, gui = "bold" })
    M.highlight("@markup.heading.1.markdown", { fg = M.colors.green, gui = "bold" })
    M.highlight("@markup.heading.2.markdown", { fg = M.colors.blue, gui = "bold" })
    M.highlight("@markup.heading.3.markdown", { fg = M.colors.red, gui = "bold" })
    M.highlight("@markup.heading.4.markdown", { fg = M.colors.purple, gui = "bold" })
    M.highlight("@markup.heading.5.markdown", { fg = M.colors.yellow, gui = "bold" })
    M.highlight("@markup.heading.6.markdown", { fg = M.colors.green, gui = "bold" })
    M.highlight("@markup.quote.markdown", { fg = M.colors.comment_grey, gui = "italic" })
    M.highlight("markdownIdDelimiter", { fg = M.colors.purple })
    M.highlight("markdownId", { fg = M.colors.purple })
    M.highlight("markdownBlockquote", { fg = M.colors.comment_grey })
    M.highlight("markdownItalic", { gui = "italic" })
    M.highlight("markdownBold", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("markdownListMarker", { fg = M.colors.red })
    M.highlight("markdownOrderedListMarker", { fg = M.colors.red })
    M.highlight("markdownIdDeclaration", { fg = M.colors.blue })
    M.highlight("markdownLinkText", { fg = M.colors.blue })
    M.highlight("markdownLinkDelimiter", { fg = M.colors.white })
    M.highlight("markdownUrl", { fg = M.colors.purple })
    M.highlight("MDTSFencedCodeBlock", { fg = M.colors.red })
    M.highlight("MDTSFencedCodeBlockInfo", { fg = M.colors.dark_yellow })
    M.highlight("@text.reference", { fg = M.colors.blue })
    M.highlight("MDTSLinkText", { fg = M.colors.white })

    M.highlight("CodeBlock", { bg = M.colors.dimm_black })
    M.highlight("HeadlineGreen", { bg = M.colors.diff_green })
    M.highlight("HeadlineBlue", { bg = M.colors.dimm_cursor_grey })
    M.highlight("HeadlineRed", { bg = M.colors.diff_red })
    M.highlight("HeadlinePurple", { bg = M.colors.diff_purple })
    M.highlight("HeadlineYellow", { bg = M.colors.diff_yellow })
    M.highlight("@OrgTSHeadlineLevel1", { fg = M.colors.green, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel2", { fg = M.colors.blue, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel3", { fg = M.colors.red, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel4", { fg = M.colors.purple, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel5", { fg = M.colors.yellow, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel6", { fg = M.colors.green, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel7", { fg = M.colors.blue, gui = "bold" })
    M.highlight("@OrgTSHeadlineLevel8", { fg = M.colors.red, gui = "bold" })

    --- Render Markdown
    M.highlight("RenderMarkdownError", { fg = M.colors.red })
    M.highlight("RenderMarkdownWarn", { fg = M.colors.dark_yellow })
    M.highlight("RenderMarkdownSuccess", { fg = M.colors.green })
    M.highlight("RenderMarkdownInfo", { fg = M.colors.blue })
    M.highlight("RenderMarkdownHint", { fg = M.colors.cyan })
    M.highlight("RenderMarkdownQuote", { fg = M.colors.comment_grey, gui = "italic" })
    M.highlight("RenderMarkdownCode", { bg = M.colors.dark_black })

    --- Treesitter
    -- Misc
    M.highlight("TSError", { fg = M.colors.red })
    M.highlight("TSPunctDelimiter", { fg = M.colors.bracket_grey })
    M.highlight("TSPunctBracket", { fg = M.colors.bracket_grey })
    M.highlight("TSPunctSpecial", { fg = M.colors.bracket_grey })

    -- -- Constants
    -- -- M.highlight("TSConstant", {})
    M.highlight("TSConstBuiltin", { fg = M.colors.dark_yellow, gui = "bold" })
    -- -- Not sure about this guy
    -- M.highlight("TSConstMacro", {})
    -- M.highlight("TSString", {})
    -- M.highlight("TSStringRegex", {})
    M.highlight("TSStringEscape", { fg = M.colors.yellow })
    -- M.highlight("TSCharacter", {})
    -- M.highlight("TSNumber", {})
    -- M.highlight("TSBoolean", {})
    -- M.highlight("TSFloat", {})
    -- M.highlight("TSAnnotation", {})
    -- M.highlight("TSAttribute", {})
    -- M.highlight("TSNamespace", {})

    -- -- Functions
    M.highlight("TSFuncBuiltin", { fg = M.colors.dark_yellow, gui = "bold" })
    -- M.highlight("TSFunction", {})
    -- M.highlight("TSFuncMacro", {})
    -- M.highlight("TSParameter", {})
    -- M.highlight("TSParameterReference", {})
    -- M.highlight("TSMethod", {})
    -- M.highlight("TSField", {})
    -- M.highlight("TSProperty", {})
    M.highlight("TSConstructor", { fg = M.colors.red, gui = "bold" })

    -- -- Keywords
    -- M.highlight("TSConditional", {})
    -- M.highlight("TSRepeat", {})
    -- M.highlight("TSLabel", {})
    -- M.highlight("TSKeyword", {})
    -- M.highlight("TSKeywordFunction", {})
    -- M.highlight("TSKeywordOperator", {})
    -- M.highlight("TSOperator", {})
    -- M.highlight("TSException", {})
    -- M.highlight("TSType", {})
    M.highlight("TSTypeBuiltin", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("TSTextReference", { fg = M.colors.blue, gui = "underline" })
    -- M.highlight("TSStructure", {})
    -- M.highlight("TSInclude", {})

    -- -- Variable
    -- M.highlight("TSVariable", {})
    M.highlight("TSVariableBuiltin", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("@variable", { fg = M.colors.white })

    -- -- Text
    -- M.highlight("TSText", {})
    -- M.highlight("TSStrong", {})
    -- M.highlight("TSEmphasis", {})
    -- M.highlight("TSUnderline", {})
    -- M.highlight("TSTitle", {})
    -- M.highlight("TSLiteral", {})
    M.highlight("TSURI", { fg = M.colors.blue, gui = "underline" })

    -- -- Tags
    -- M.highlight("TSTag", {})
    -- M.highlight("TSTagDelimiter", {})

    --- Plugins
    M.highlight("illuminatedWord", { gui = "bold" })

    M.highlight("diffAdded", { fg = M.colors.green })
    M.highlight("diffRemoved", { fg = M.colors.red })
    M.highlight("gitcommitComment", { fg = M.colors.gutter_fg_grey, gui = "italic,bold" })
    M.highlight("gitcommitUnmerged", { fg = M.colors.green })
    M.highlight("gitcommitOnBranch", {})
    M.highlight("gitcommitBranch", { fg = M.colors.purple })
    M.highlight("gitcommitDiscardedType", { fg = M.colors.red })
    M.highlight("gitcommitSelectedType", { fg = M.colors.green })
    M.highlight("gitcommitHeader", {})
    M.highlight("gitcommitUntrackedFile", { fg = M.colors.cyan })
    M.highlight("gitcommitDiscardedFile", { fg = M.colors.red })
    M.highlight("gitcommitSelectedFile", { fg = M.colors.green })
    M.highlight("gitcommitUnmergedFile", { fg = M.colors.yellow })
    M.highlight("gitcommitFile", {})
    M.highlight("gitcommitSummary", { fg = M.colors.white })
    M.highlight("gitcommitOverflow", { fg = M.colors.red })

    M.highlight("GitHubUserName", { fg = M.colors.purple, gui = "italic" })
    M.highlight("GitHubDate", { fg = M.colors.yellow })
    M.highlight("GitHubCommentLength", { fg = M.colors.comment_grey, gui = "italic" })
    M.highlight("GitHubAuthorAssociation", { fg = M.colors.special_grey, gui = "italic,bold" })

    M.highlight("Defx_git_Untracked", { fg = M.colors.red })
    M.link("Defx_git_4_Untracked", "gitcommitUntrackedFile")
    M.link("Defx_git_4_Ignored", "gitcommitSummary")
    M.link("Defx_git_4_Unknown", "gitcommitSummary")
    M.link("Defx_git_4_Renamed", "gitcommitBranch")
    M.link("Defx_git_4_Modified", "gitcommitUnmergedFile")
    M.link("Defx_git_4_Unmerged", "diffRemoved")
    M.link("Defx_git_4_Deleted", "diffRemoved")
    M.link("Defx_git_4_Staged", "diffAdded")

    M.highlight("VimwikiHR", { fg = M.colors.yellow })
    M.highlight("VimwikiPre", { fg = M.colors.cursor_grey })
    M.highlight("VimwikiItalic", { gui = "italic" })
    M.highlight("OrgColorTagRed", { fg = M.colors.red })
    M.highlight("OrgColorTagCyan", { fg = M.colors.cyan })
    M.highlight("OrgColorTagGreen", { fg = M.colors.green })
    M.highlight("OrgColorTagBlue", { fg = M.colors.blue })
    M.highlight("OrgColorTagPurple", { fg = M.colors.purple })
    M.highlight("OrgColorTagYellow", { fg = M.colors.yellow })
    M.highlight("OrgColorTagOrange", { fg = M.colors.dark_yellow })
    M.highlight("VimwikiDate", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("VimwikiHeaderChar", { fg = M.colors.comment_grey })
    M.highlight("OrgQuote", { fg = M.colors.bracket_grey, gui = "italic" })

    M.highlight("RainbowDelimiterRed", { fg = M.colors.red })
    M.highlight("RainbowDelimiterCyan", { fg = M.colors.cyan })
    M.highlight("RainbowDelimiterGreen", { fg = M.colors.green })
    M.highlight("RainbowDelimiterBlue", { fg = M.colors.blue })
    M.highlight("RainbowDelimiterPurple", { fg = M.colors.purple })
    M.highlight("RainbowDelimiterYellow", { fg = M.colors.yellow })
    M.highlight("RainbowDelimiterOrange", { fg = M.colors.dark_yellow })

    M.highlight("Whitespace", { fg = M.colors.cursor_grey })

    M.link("gwitcommitNoBranch", "gitcommitBranch")
    M.link("gitcommitUntracked", "gitcommitComment")
    M.link("gitcommitDiscarded", "gitcommitComment")
    M.link("gitcommitSelected", "gitcommitComment")
    M.link("gitcommitDiscardedArrow", "gitcommitDiscardedFile")
    M.link("gitcommitSelectedArrow", "gitcommitSelectedFile")
    M.link("gitcommitUnmergedArrow", "gitcommitUnmergedFile")

    M.link("gitmessengerPopupNormal", "WinNormalNC")

    M.highlight("GitGutterAdd", { fg = M.colors.green })
    M.highlight("GitGutterChange", { fg = M.colors.dark_yellow })
    M.highlight("GitGutterDelete", { fg = M.colors.red })

    M.highlight("EchoDocFloat", { bg = M.colors.dark_black })

    M.highlight("DiagnosticError", { fg = M.colors.dark_red, gui = "bold" })
    M.highlight("DiagnosticWarn", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("DiagnosticInfo", { fg = M.colors.cyan, gui = "bold" })
    M.highlight("DiagnosticHint", { fg = M.colors.comment_grey, gui = "bold" })
    M.highlight("DiagnosticUnderlineError", { sp = M.colors.dark_red, gui = "undercurl" })
    M.highlight("DiagnosticUnderlineWarn", { sp = M.colors.dark_yellow, gui = "undercurl" })
    M.highlight("DiagnosticUnderlineInfo", { sp = M.colors.cyan, gui = "undercurl" })
    M.highlight("DiagnosticUnderlineHint", { sp = M.colors.comment_grey, gui = "undercurl" })
    M.highlight("FloatBorder", { fg = M.colors.comment_grey })
    M.highlight("FloatBorderDark", { fg = M.colors.comment_grey, bg = M.colors.dark_black })
    M.highlight("FloatShadow", { bg = M.colors.black, blend = 80 })
    M.highlight("FloatShadowThrough", { bg = M.colors.black, blend = 100 })

    M.highlight("TSDefinitionUsage", { gui = "bold" })
    M.highlight("TSDefinition", { gui = "bold" })

    M.highlight("RenamePrompt", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("DiagnosticSource", { fg = M.colors.cursor_grey, gui = "bold" })

    M.link("BqfPreviewRange", "DiffChange")

    M.link("Dash", "markdownBold")

    M.highlight("CmpItemAbbr", { fg = M.colors.white })
    M.highlight("CmpItemAbbrDeprecated", { fg = M.colors.comment_grey })
    M.highlight("CmpItemAbbrMatchFuzzy", { fg = M.colors.yellow })
    M.highlight("CmpItemMenu", { fg = M.colors.comment_grey })
    M.highlight("CmpItemKindMethod", { fg = M.colors.blue })
    M.highlight("CmpItemKindFunction", { fg = M.colors.blue })
    M.highlight("CmpItemKindVariable", { fg = M.colors.red })
    M.highlight("CmpItemKindConstant", { fg = M.colors.purple })
    M.highlight("CmpItemKindProperty", { fg = M.colors.red })
    M.highlight("CmpItemKindField", { fg = M.colors.red })
    M.highlight("CmpItemKindEnumMember", { fg = M.colors.cyan })
    M.highlight("CmpItemKindText", { fg = M.colors.yellow })
    M.highlight("CmpItemKindClass", { fg = M.colors.dark_yellow })
    M.highlight("CmpItemKindInterface", { fg = M.colors.dark_yellow })
    M.highlight("CmpItemKindStruct", { fg = M.colors.dark_yellow })
    M.highlight("CmpItemKindModule", { fg = M.colors.cyan })

    M.highlight("LightspeedUnlabeledMatch", { bg = M.colors.red, fg = M.colors.black, gui = "bold" })
    M.highlight("LightspeedLabel", { fg = M.colors.purple, gui = "bold" })
    M.highlight("LightspeedShortcut", { bg = M.colors.purple, fg = M.colors.black, gui = "bold" })

    M.highlight("org_hyperlink", { fg = M.colors.blue, gui = "underline" })
    M.highlight("org_verbatim", { fg = M.colors.bracket_grey, gui = "italic" })
    M.highlight("org_code", { fg = M.colors.yellow, bg = M.colors.dimm_black })
    M.highlight("OrgTSTable", { bg = M.colors.dark_cursor_grey })

    M.highlight("CodeBlock", { bg = M.colors.dimm_black })
    M.highlight("Quote", { fg = M.colors.dark_yellow })

    M.highlight("NotifyERRORBorder", { fg = M.colors.red })
    M.highlight("NotifyWARNBorder", { fg = M.colors.dark_yellow })
    M.highlight("NotifyINFOBorder", { fg = M.colors.green })
    M.highlight("NotifyDEBUGBorder", { fg = M.colors.comment_grey })
    M.highlight("NotifyTRACEBorder", { fg = M.colors.purple })
    M.highlight("NotifyERRORIcon", { fg = M.colors.red })
    M.highlight("NotifyWARNIcon", { fg = M.colors.dark_yellow })
    M.highlight("NotifyINFOIcon", { fg = M.colors.green })
    M.highlight("NotifyDEBUGIcon", { fg = M.colors.comment_grey })
    M.highlight("NotifyTRACEIcon", { fg = M.colors.purple })
    M.highlight("NotifyERRORTitle", { fg = M.colors.red })
    M.highlight("NotifyWARNTitle", { fg = M.colors.dark_yellow })
    M.highlight("NotifyINFOTitle", { fg = M.colors.green })
    M.highlight("NotifyDEBUGTitle", { fg = M.colors.comment_grey })
    M.highlight("NotifyTRACETitle", { fg = M.colors.purple })

    M.highlight("NavicSeparator", { fg = M.colors.comment_grey, bg = M.colors.dark_black })

    M.highlight("NavicIconsString", { fg = M.colors.green, bg = M.colors.dark_black })
    M.highlight("NavicIconsArray", { fg = M.colors.yellow, bg = M.colors.dark_black })
    M.highlight("NavicIconsModule", { fg = M.colors.purple, bg = M.colors.dark_black })
    M.highlight("NavicIconsFunction", { fg = M.colors.green, bg = M.colors.dark_black })
    M.highlight("NavicIconsMethod", { fg = M.colors.green, bg = M.colors.dark_black })
    M.highlight("NavicIconsVariable", { fg = M.colors.blue, bg = M.colors.dark_black })
    M.highlight("NavicIconsConstant", { fg = M.colors.purple, bg = M.colors.dark_black })
    M.highlight("NavicIconsProperty", { fg = M.colors.blue, bg = M.colors.dark_black })
    M.highlight("NavicIconsStruct", { fg = M.colors.purple, bg = M.colors.dark_black })
    M.highlight("NavicIconsInterface", { fg = M.colors.cyan, bg = M.colors.dark_black })
    M.highlight("NavicIconsEnum", { fg = M.colors.yellow, bg = M.colors.dark_black })
    M.highlight("NavicIconsField", { fg = M.colors.yellow, bg = M.colors.dark_black })
    M.highlight("NavicIconsClass", { fg = M.colors.purple, bg = M.colors.dark_black })

    M.highlight("NavicText", { fg = M.colors.comment_grey, bg = M.colors.dark_black })

    M.highlight("CCovered", { fg = M.colors.dark_green })
    -- M.highlight("CUncovered", { fg = M.colors.red })

    M.highlight("DapUIScope", { fg = M.colors.blue })
    M.highlight("DapUIType", { fg = M.colors.yellow })
    M.highlight("DapUIVariable", { fg = M.colors.red })
    M.highlight("DapUIDecoration", { fg = M.colors.purple })
    M.highlight("DapUIModifiedValue", { fg = M.colors.dark_yellow, gui = "bold" })
    M.highlight("DapUIThread", { fg = M.colors.green })
    M.highlight("DapUIStoppedThread", { fg = M.colors.cyan })
    M.highlight("DapUISource", { fg = M.colors.green })
    M.highlight("DapUILineNumber", { fg = M.colors.dark_yellow })
    M.highlight("DapUIFloatBorder", { fg = M.colors.comment_grey })
    M.highlight("DapUIWatchesHeader", { fg = M.colors.cyan })
    M.highlight("DapUIWatchesEmpty", { fg = M.colors.red })
    M.highlight("DapUIWatchesValue", { fg = M.colors.green })
    M.highlight("DapUIWatchesError", { fg = M.colors.dark_red })
    M.highlight("DapUIWatchesFrame", { fg = M.colors.purple })
    M.highlight("DapUIBreakpointsPath", { fg = M.colors.green })
    M.highlight("DapUIBreakpointsInfo", { fg = M.colors.green })
    M.highlight("DapUIBreakpointsCurrentLine", { fg = M.colors.yellow })
    M.highlight("DapUIBreakpointsLine", { fg = M.colors.cyan })
    M.highlight("DapUIFrameName", { fg = M.colors.red })

    M.highlight("OctoEditable", { bg = M.colors.dimm_black })

    M.highlight("SjLabel", { fg = M.colors.black, bg = M.colors.purple, gui = "bold" })
    M.highlight("SjSearch", { fg = M.colors.green })

    M.highlight("PackageInfoUpToDateVersion", { fg = M.colors.cyan })
    M.highlight("PackageInfoOutdatedVersion", { fg = M.colors.dark_yellow })

    M.highlight("NeotestUnknown", { fg = M.colors.comment_grey })
    M.highlight("NeotestSkipped", { fg = M.colors.yellow })
    M.highlight("NeotestRunning", { fg = M.colors.purple })
    M.highlight("NeotestPassed", { fg = M.colors.green })
    M.highlight("NeotestFailed", { fg = M.colors.dark_red })
end

return M
