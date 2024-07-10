-- ==========================================================================
-- Colourscheme
-- ==========================================================================
vim.cmd.colorscheme("habamax")

local hl = vim.api.nvim_set_hl
--@param link string
local function ghl(link)
	local link_opts = vim.api.nvim_get_hl(0, { name = link, link = false })
	return link_opts
end

local theme = {
	bg50 = "#fafafa",
	bg100 = "#f4f4f5",
	bg200 = "#e4e4e7",
	bg300 = "#d4d4d4",
	bg400 = "#a1a1aa",
	bg500 = "#71717a",
	bg600 = "#52525b",
	bg700 = "#3f3f46",
	bg800 = "#27272a",
	bg900 = "#18181b",
	bg950 = "#09090b",
	accent = "#FFA057",
	skyblue = "#6d8a96",

	diagError = "#f87171",
	diagWarn = "#fdba74",
	diagInfo = "#7dd3fc",
	diagHint = "#34d399",
	red100 = "#EE5396",
	champagne = "#FAE3C6",
}

local c = theme

-- diffchange is the gray git border color
hl(0, "FloatBorder", { bg = c.bg800, fg = c.bg800 }) -- border of floating windows, like oil
hl(0, "Constant", { bg = "NONE", fg = c.accent }) -- highlights cmp menu and text
hl(0, "Normal", { bg = c.bg900, fg = c.bg200 }) -- highlights cmp menu and text
hl(0, "Comment", { bg = "NONE", fg = c.bg600, italic = true }) -- highlights cmp menu and text
-- GIT
hl(0, "DiffChange", { bg = "NONE", fg = c.champagne })
hl(0, "@lsp.type.function.lua", { link = "Special" })
-- hl(0, "@lsp.type.parameter.javascript", { fg = c.skyblue, italic = true })
-- hl(0, "@lsp.type.property.javascript", { link = "Special" })
-- hl(0, "@lsp.type.member.javascript", { fg = ghl("Special").fg, italic = true })
-- hl(0, "@lsp.type.function.javascript", { link = "Type" })
-- hl(0, "@lsp.typemod.variable.local.javascript", { link = "Character" })
-- CMP
hl(0, "CmpMenu", { bg = c.bg900, fg = c.bg500 }) -- highlights cmp menu and text
hl(0, "CmpMenuBorder", { bg = c.bg900, fg = c.bg700 }) -- highlights cmp menu border
hl(0, "CmpMenuSelect", { fg = ghl("Constant").fg, bg = c.bg800 }) -- hls the tab select colors
hl(0, "CmpItemAbbrMatch", { fg = ghl("Constant").fg, bg = "NONE" }) -- hls the type matches
hl(0, "CmpItemKind", { fg = c.bg600, bg = "NONE" }) -- hls the type matches

-- Telescope
hl(0, "TelescopeNormal", { fg = c.bg400, bg = c.bg900 }) -- hls for the inner backgrounds
hl(0, "TelescopeBorder", { fg = c.bg700, bg = c.bg900 }) -- global borders
hl(0, "TelescopeTitle", { fg = ghl("Constant").fg, bg = "NONE" }) -- all title colours

hl(0, "TelescopeMatching", { fg = c.accent }) -- matching characters
hl(0, "TelescopeMultiSelection", { fg = c.bg500 }) -- hl for selected item
hl(0, "TelescopeMultiIcon", { fg = ghl("Comment").fg }) -- hl for selectied icon
hl(0, "TelescopeSelection", { fg = c.bg200, bg = c.bg800 }) -- hls the tab select colors

hl(0, "TelescopePromptNormal", { bg = c.bg900, fg = c.bg300 }) -- prompt text and background inner
hl(0, "TelescopePromptPrefix", { fg = ghl("Constant").fg })
hl(0, "TelescopePromptBorder", { fg = c.bg700, bg = c.bg900 }) -- global borders
hl(0, "TelescopePreviewLine", { fg = c.bg300, bg = c.bg800 })

-- Diagnsotics
hl(0, "DiagnosticError", { fg = c.diagError })
hl(0, "DiagnosticSignError", { bg = "NONE", fg = c.diagError })
hl(0, "DiagnosticSignWarn", { bg = "NONE", fg = c.diagWarn })
hl(0, "DiagnosticWarn", { bg = "NONE", fg = c.diagWarn })
hl(0, "DiagnosticSignInfo", { bg = "NONE", fg = c.diagInfo })
hl(0, "DiagnosticInfo", { bg = "NONE", fg = c.diagInfo })
hl(0, "DiagnosticSignHint", { bg = "NONE", fg = c.diagHint })
hl(0, "DiagnosticHint", { bg = "NONE", fg = c.diagWarn })

hl(0, "DiagnosticUnderlineHint", { undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
hl(0, "DiagnosticUnderlineError", { undercurl = true })
hl(0, "DiagnosticUnnecessary", { italic = true, fg = c.bg500 })

--Oil
hl(0, "OilDir", { bg = "NONE", fg = c.skyblue, bold = true })
hl(0, "OilFile", { bg = "NONE", fg = c.bg300 })

-- Which key

hl(0, "WhichKeyBorder", { bg = c.bg900, fg = c.bg700 })
hl(0, "WhichKeyFloat", { bg = c.bg900 })

-- Tabline
hl(0, "TablineFill", { link = "Comment" })
hl(0, "StatusLine", { fg = c.bg400 })
-- hl(0, "StatusLineNC", { link = "Comment" })
hl(0, "StatusLineNC", { fg = c.bg700 })

hl(0, "@lsp.type.function.lua", { link = "Special" })
