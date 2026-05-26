local p = require("umbra.palette")

local function hi(groups)
  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end
end

local M = {}

function M.load()
  -- ── Editor UI ──────────────────────────────────────────────────────────────
  hi({
    Normal         = { fg = p.fg0,       bg = p.bg1 },
    NormalFloat    = { fg = p.fg0,       bg = p.bg2 },
    NormalNC       = { fg = p.fg1,       bg = p.bg0 },
    SignColumn     = { fg = p.fg3,       bg = p.bg1 },
    ColorColumn    = {                   bg = p.bg2 },
    CursorLine     = {                   bg = p.bg2 },
    CursorLineNr   = { fg = p.iris,      bold = true },
    LineNr         = { fg = p.fg3 },
    LineNrAbove    = { fg = p.fg3 },
    LineNrBelow    = { fg = p.fg3 },
    Folded         = { fg = p.fg3,       bg = p.bg2 },
    FoldColumn     = { fg = p.fg3,       bg = p.bg1 },
    VertSplit      = { fg = p.line },
    WinSeparator   = { fg = p.line },
    StatusLine     = { fg = p.fg1,       bg = p.bg2 },
    StatusLineNC   = { fg = p.fg3,       bg = p.bg1 },
    TabLine        = { fg = p.fg2,       bg = p.bg2 },
    TabLineFill    = {                   bg = p.bg1 },
    TabLineSel     = { fg = p.iris,      bg = p.bg3,  bold = true },
    WinBar         = { fg = p.fg2,       bg = p.bg1 },
    WinBarNC       = { fg = p.fg3,       bg = p.bg0 },

    -- Cursor
    Cursor         = { fg = p.bg0,       bg = p.iris },
    CursorIM       = { fg = p.bg0,       bg = p.iris },
    TermCursor     = { fg = p.bg0,       bg = p.iris },
    lCursor        = { fg = p.bg0,       bg = p.mauve },

    -- Selection / search
    Visual         = {                   bg = p.bg4 },
    VisualNOS      = {                   bg = p.bg4 },
    Search         = { fg = p.bg0,       bg = p.iris },
    IncSearch      = { fg = p.bg0,       bg = p.mauve },
    CurSearch      = { fg = p.bg0,       bg = p.mauve },
    Substitute     = { fg = p.bg0,       bg = p.yellow },

    -- Popup / completion
    Pmenu          = { fg = p.fg1,       bg = p.bg2 },
    PmenuSel       = { fg = p.fg0,       bg = p.bg4,  bold = true },
    PmenuSbar      = {                   bg = p.bg3 },
    PmenuThumb     = {                   bg = p.bg5 },
    PmenuKind      = { fg = p.iris,      bg = p.bg2 },
    PmenuKindSel   = { fg = p.iris,      bg = p.bg4 },
    PmenuExtra     = { fg = p.fg3,       bg = p.bg2 },
    PmenuExtraSel  = { fg = p.fg2,       bg = p.bg4 },
    WildMenu       = { fg = p.fg0,       bg = p.bg4 },

    -- Floating windows
    FloatBorder    = { fg = p.line,      bg = p.bg2 },
    FloatTitle     = { fg = p.iris,      bg = p.bg2,  bold = true },
    FloatShadow    = {                   bg = p.bg0 },

    -- Messages
    ErrorMsg       = { fg = p.error },
    WarningMsg     = { fg = p.warn },
    ModeMsg        = { fg = p.fg0,       bold = true },
    MoreMsg        = { fg = p.iris },
    Question       = { fg = p.iris },

    -- Diff
    DiffAdd        = {                   bg = "#0e1a10" },
    DiffChange     = {                   bg = "#0f1522" },
    DiffDelete     = { fg = p.error,     bg = "#1e0d10" },
    DiffText       = {                   bg = "#152035" },
    Added          = { fg = p.green },
    Changed        = { fg = p.blue },
    Removed        = { fg = p.error },

    -- Spelling
    SpellBad       = { undercurl = true, sp = p.error },
    SpellCap       = { undercurl = true, sp = p.warn },
    SpellLocal     = { undercurl = true, sp = p.info },
    SpellRare      = { undercurl = true, sp = p.mauve },

    -- Misc UI
    NonText        = { fg = p.bg4 },
    Whitespace     = { fg = p.bg4 },
    EndOfBuffer    = { fg = p.bg2 },
    SpecialKey     = { fg = p.fg3 },
    MatchParen     = { fg = p.mauve,     bold = true,  underline = true },
    QuickFixLine   = {                   bg = p.bg3 },
    Directory      = { fg = p.blue,      bold = true },
    Title          = { fg = p.iris,      bold = true },
    Conceal        = { fg = p.fg3 },
  })

  -- ── Syntax (legacy :highlight groups) ─────────────────────────────────────
  hi({
    Comment        = { fg = p.fg3,       italic = true },
    Constant       = { fg = p.mauve },
    String         = { fg = p.green },
    Character      = { fg = p.green },
    Number         = { fg = p.yellow },
    Boolean        = { fg = p.iris,      bold = true },
    Float          = { fg = p.yellow },
    Identifier     = { fg = p.fg0 },
    Function       = { fg = p.mauve },
    Statement      = { fg = p.iris,      bold = true },
    Conditional    = { fg = p.iris,      bold = true },
    Repeat         = { fg = p.iris,      bold = true },
    Label          = { fg = p.iris },
    Operator       = { fg = p.magenta },
    Keyword        = { fg = p.iris,      bold = true },
    Exception      = { fg = p.error },
    PreProc        = { fg = p.iris },
    Include        = { fg = p.iris },
    Define         = { fg = p.iris },
    Macro          = { fg = p.iris },
    PreCondit      = { fg = p.iris },
    Type           = { fg = p.cyan },
    StorageClass   = { fg = p.iris },
    Structure      = { fg = p.cyan },
    Typedef        = { fg = p.cyan },
    Special        = { fg = p.magenta },
    SpecialChar    = { fg = p.magenta },
    Tag            = { fg = p.ansi_mag },
    Delimiter      = { fg = p.fg2 },
    SpecialComment = { fg = p.fg3,       italic = true },
    Debug          = { fg = p.warn },
    Underlined     = { underline = true },
    Ignore         = { fg = p.fg3 },
    Error          = { fg = p.error },
    Todo           = { fg = p.bg0,       bg = p.warn,  bold = true },
  })

  -- ── Treesitter ─────────────────────────────────────────────────────────────
  hi({
    ["@comment"]                   = { link = "Comment" },
    ["@comment.documentation"]     = { fg = p.fg2,      italic = true },
    ["@error"]                     = { link = "Error" },
    ["@none"]                      = { fg = p.fg0 },
    ["@preproc"]                   = { link = "PreProc" },
    ["@define"]                    = { link = "Define" },
    ["@operator"]                  = { link = "Operator" },

    ["@punctuation.delimiter"]     = { fg = p.fg2 },
    ["@punctuation.bracket"]       = { fg = p.fg2 },
    ["@punctuation.special"]       = { fg = p.magenta },

    ["@string"]                    = { link = "String" },
    ["@string.regex"]              = { fg = p.yellow },
    ["@string.escape"]             = { fg = p.magenta },
    ["@string.special"]            = { fg = p.magenta },
    ["@string.special.url"]        = { fg = p.blue,     underline = true },

    ["@character"]                 = { link = "Character" },
    ["@character.special"]         = { link = "SpecialChar" },
    ["@boolean"]                   = { link = "Boolean" },
    ["@number"]                    = { link = "Number" },
    ["@float"]                     = { link = "Float" },

    ["@function"]                  = { link = "Function" },
    ["@function.builtin"]          = { fg = p.mauve,    italic = true },
    ["@function.call"]             = { fg = p.mauve },
    ["@function.macro"]            = { fg = p.iris },
    ["@function.method"]           = { fg = p.mauve },
    ["@function.method.call"]      = { fg = p.mauve },

    ["@constructor"]               = { fg = p.cyan },
    ["@parameter"]                 = { fg = p.fg0 },
    ["@keyword"]                   = { link = "Keyword" },
    ["@keyword.function"]          = { fg = p.iris,     bold = true },
    ["@keyword.operator"]          = { fg = p.magenta,  bold = true },
    ["@keyword.return"]            = { fg = p.iris,     bold = true },
    ["@keyword.import"]            = { fg = p.iris },
    ["@keyword.type"]              = { fg = p.iris },
    ["@keyword.modifier"]          = { fg = p.iris },
    ["@keyword.repeat"]            = { fg = p.iris,     bold = true },
    ["@keyword.exception"]         = { fg = p.error },
    ["@keyword.conditional"]       = { fg = p.iris,     bold = true },
    ["@keyword.conditional.ternary"] = { fg = p.magenta },

    ["@conditional"]               = { link = "Conditional" },
    ["@repeat"]                    = { link = "Repeat" },
    ["@label"]                     = { link = "Label" },
    ["@include"]                   = { link = "Include" },
    ["@exception"]                 = { link = "Exception" },

    ["@type"]                      = { link = "Type" },
    ["@type.builtin"]              = { fg = p.cyan,     italic = true },
    ["@type.definition"]           = { fg = p.cyan },
    ["@type.qualifier"]            = { fg = p.iris },

    ["@storageclass"]              = { link = "StorageClass" },
    ["@attribute"]                 = { fg = p.yellow },
    ["@field"]                     = { fg = p.br_blue },
    ["@property"]                  = { fg = p.br_blue },

    ["@variable"]                  = { fg = p.fg0 },
    ["@variable.builtin"]          = { fg = p.red,      italic = true },
    ["@variable.parameter"]        = { fg = p.fg0 },
    ["@variable.member"]           = { fg = p.br_blue },

    ["@constant"]                  = { link = "Constant" },
    ["@constant.builtin"]          = { fg = p.mauve,    bold = true },
    ["@constant.macro"]            = { fg = p.iris },

    ["@namespace"]                 = { fg = p.cyan },
    ["@module"]                    = { fg = p.cyan },
    ["@symbol"]                    = { fg = p.magenta },

    ["@text"]                      = { fg = p.fg0 },
    ["@text.strong"]               = { bold = true },
    ["@text.emphasis"]             = { italic = true },
    ["@text.underline"]            = { underline = true },
    ["@text.strike"]               = { strikethrough = true },
    ["@text.title"]                = { fg = p.iris,     bold = true },
    ["@text.quote"]                = { fg = p.fg2,      italic = true },
    ["@text.uri"]                  = { fg = p.blue,     underline = true },
    ["@text.math"]                 = { fg = p.mauve },
    ["@text.reference"]            = { fg = p.br_blue },
    ["@text.todo"]                 = { link = "Todo" },
    ["@text.note"]                 = { fg = p.info,     bold = true },
    ["@text.warning"]              = { fg = p.warn,     bold = true },
    ["@text.danger"]               = { fg = p.error,    bold = true },

    ["@tag"]                       = { fg = p.ansi_mag },
    ["@tag.attribute"]             = { fg = p.yellow },
    ["@tag.delimiter"]             = { fg = p.fg3 },

    ["@markup.strong"]             = { bold = true },
    ["@markup.italic"]             = { italic = true },
    ["@markup.strikethrough"]      = { strikethrough = true },
    ["@markup.underline"]          = { underline = true },
    ["@markup.heading"]            = { fg = p.iris,     bold = true },
    ["@markup.quote"]              = { fg = p.fg2,      italic = true },
    ["@markup.math"]               = { fg = p.mauve },
    ["@markup.link"]               = { fg = p.br_blue },
    ["@markup.link.url"]           = { fg = p.blue,     underline = true },
    ["@markup.link.label"]         = { fg = p.iris },
    ["@markup.raw"]                = { fg = p.green },
    ["@markup.list"]               = { fg = p.iris },
    ["@markup.list.checked"]       = { fg = p.green },
    ["@markup.list.unchecked"]     = { fg = p.fg3 },
  })

  -- ── LSP ────────────────────────────────────────────────────────────────────
  hi({
    LspReferenceText           = {             bg = p.bg3 },
    LspReferenceRead           = {             bg = p.bg3 },
    LspReferenceWrite          = {             bg = p.bg4 },
    LspSignatureActiveParameter = { fg = p.iris, underline = true },
    LspCodeLens                = { fg = p.fg3,  italic = true },
    LspCodeLensSeparator       = { fg = p.line },
    LspInlayHint               = { fg = p.fg3,  bg = p.bg2, italic = true },

    DiagnosticError            = { fg = p.error },
    DiagnosticWarn             = { fg = p.warn },
    DiagnosticInfo             = { fg = p.info },
    DiagnosticHint             = { fg = p.iris },
    DiagnosticOk               = { fg = p.success },
    DiagnosticUnnecessary      = { fg = p.fg3,  italic = true },

    DiagnosticUnderlineError   = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = p.warn },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint    = { undercurl = true, sp = p.iris },

    DiagnosticVirtualTextError = { fg = p.error, bg = "#1c0c0e", italic = true },
    DiagnosticVirtualTextWarn  = { fg = p.warn,  bg = "#1c160a", italic = true },
    DiagnosticVirtualTextInfo  = { fg = p.info,  bg = "#0e1820", italic = true },
    DiagnosticVirtualTextHint  = { fg = p.iris,  bg = "#16091c", italic = true },

    DiagnosticSignError        = { fg = p.error },
    DiagnosticSignWarn         = { fg = p.warn },
    DiagnosticSignInfo         = { fg = p.info },
    DiagnosticSignHint         = { fg = p.iris },
  })

  -- ── Neovim built-in semantic tokens ───────────────────────────────────────
  hi({
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.decorator"]     = { fg = p.yellow },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.enumMember"]    = { fg = p.mauve },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.interface"]     = { fg = p.cyan },
    ["@lsp.type.macro"]         = { link = "@function.macro" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.namespace"]     = { link = "@namespace" },
    ["@lsp.type.parameter"]     = { link = "@parameter" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.typeParameter"] = { fg = p.cyan,    italic = true },
    ["@lsp.type.variable"]      = { link = "@variable" },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.comment"]       = { link = "@comment" },
    ["@lsp.type.string"]        = { link = "@string" },
    ["@lsp.type.number"]        = { link = "@number" },
    ["@lsp.type.operator"]      = { link = "@operator" },
    ["@lsp.type.selfKeyword"]   = { fg = p.red,     italic = true },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.readonly"]       = { fg = p.mauve },
    ["@lsp.mod.static"]         = { italic = true },
  })

  -- ── Popular plugins ────────────────────────────────────────────────────────
  hi({
    -- nvim-cmp
    CmpItemAbbr            = { fg = p.fg1 },
    CmpItemAbbrDeprecated  = { fg = p.fg3, strikethrough = true },
    CmpItemAbbrMatch       = { fg = p.iris, bold = true },
    CmpItemAbbrMatchFuzzy  = { fg = p.iris },
    CmpItemKind            = { fg = p.fg2 },
    CmpItemMenu            = { fg = p.fg3 },

    -- Telescope
    TelescopeNormal        = { fg = p.fg0,  bg = p.bg2 },
    TelescopeBorder        = { fg = p.line, bg = p.bg2 },
    TelescopePromptNormal  = { fg = p.fg0,  bg = p.bg3 },
    TelescopePromptBorder  = { fg = p.line, bg = p.bg3 },
    TelescopePromptTitle   = { fg = p.bg0,  bg = p.iris, bold = true },
    TelescopePreviewTitle  = { fg = p.bg0,  bg = p.cyan, bold = true },
    TelescopeResultsTitle  = { fg = p.fg3,  bg = p.bg2 },
    TelescopeSelection     = { fg = p.fg0,  bg = p.bg4 },
    TelescopeSelectionCaret = { fg = p.iris },
    TelescopeMatching      = { fg = p.iris, bold = true },
    TelescopeMultiSelection = { fg = p.mauve },

    -- fzf-lua / snacks.picker
    FzfLuaNormal           = { fg = p.fg0,  bg = p.bg2 },
    FzfLuaBorder           = { fg = p.line, bg = p.bg2 },
    FzfLuaCursorLine       = {              bg = p.bg4 },
    FzfLuaHeaderText       = { fg = p.iris },
    FzfLuaHeaderBind       = { fg = p.mauve },

    -- nvim-tree / neo-tree
    NvimTreeNormal         = { fg = p.fg1,  bg = p.bg0 },
    NvimTreeNormalNC       = { fg = p.fg2,  bg = p.bg0 },
    NvimTreeRootFolder     = { fg = p.iris, bold = true },
    NvimTreeFolderIcon     = { fg = p.blue },
    NvimTreeOpenedFolderIcon = { fg = p.iris },
    NvimTreeFileIcon       = { fg = p.fg1 },
    NvimTreeGitNew         = { fg = p.green },
    NvimTreeGitDirty       = { fg = p.yellow },
    NvimTreeGitDeleted     = { fg = p.error },
    NvimTreeGitStaged      = { fg = p.green },
    NvimTreeIndentMarker   = { fg = p.bg5 },
    NvimTreeCursorLine     = {              bg = p.bg2 },
    NvimTreeExecFile       = { fg = p.green },
    NvimTreeSpecialFile    = { fg = p.magenta },

    -- which-key
    WhichKey               = { fg = p.iris },
    WhichKeyGroup          = { fg = p.cyan },
    WhichKeyDesc           = { fg = p.fg1 },
    WhichKeySeparator      = { fg = p.fg3 },
    WhichKeyFloat          = {              bg = p.bg2 },
    WhichKeyBorder         = { fg = p.line, bg = p.bg2 },
    WhichKeyValue          = { fg = p.mauve },

    -- gitsigns
    GitSignsAdd            = { fg = p.green },
    GitSignsChange         = { fg = p.blue },
    GitSignsDelete         = { fg = p.error },
    GitSignsAddNr          = { fg = p.green },
    GitSignsChangeNr       = { fg = p.blue },
    GitSignsDeleteNr       = { fg = p.error },
    GitSignsAddLn          = {              bg = "#0e1a10" },
    GitSignsChangeLn       = {              bg = "#0f1522" },
    GitSignsCurrentLineBlame = { fg = p.fg3, italic = true },

    -- indent-blankline
    IblIndent              = { fg = p.bg3 },
    IblScope               = { fg = p.bg5 },
    IndentBlanklineChar    = { fg = p.bg3 },
    IndentBlanklineContextChar = { fg = p.bg5 },

    -- mini.statusline / lualine
    MiniStatuslineModeNormal  = { fg = p.bg0, bg = p.iris,    bold = true },
    MiniStatuslineModeInsert  = { fg = p.bg0, bg = p.green,   bold = true },
    MiniStatuslineModeVisual  = { fg = p.bg0, bg = p.mauve,   bold = true },
    MiniStatuslineModeReplace = { fg = p.bg0, bg = p.error,   bold = true },
    MiniStatuslineModeCommand = { fg = p.bg0, bg = p.yellow,  bold = true },
    MiniStatuslineModeOther   = { fg = p.bg0, bg = p.cyan,    bold = true },
    MiniStatuslineFilename    = { fg = p.fg1, bg = p.bg2 },
    MiniStatuslineFileinfo    = { fg = p.fg2, bg = p.bg2 },
    MiniStatuslineDevinfo     = { fg = p.fg2, bg = p.bg3 },
    MiniStatuslineInactive    = { fg = p.fg3, bg = p.bg1 },

    -- mini.clue / mini.pick
    MiniPickMatchCurrent   = {              bg = p.bg4 },
    MiniPickMatchMarked    = { fg = p.mauve },
    MiniPickMatchRanges    = { fg = p.iris, bold = true },
    MiniPickBorder         = { fg = p.line },
    MiniPickBorderText     = { fg = p.iris },
    MiniPickPrompt         = { fg = p.iris, bold = true },

    -- flash.nvim
    FlashLabel             = { fg = p.bg0,  bg = p.iris,   bold = true },
    FlashMatch             = { fg = p.bg0,  bg = p.mauve },
    FlashCurrent           = { fg = p.bg0,  bg = p.yellow },
    FlashBackdrop          = { fg = p.fg3 },
  })
end

return M
