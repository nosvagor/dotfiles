local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local keymap = require("cmp.utils.keymap")
local feedkeys = require("cmp.utils.feedkeys")

local kind_icons = {
	Text = "",
	Method = "⟜",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-1),
		["<C-d>"] = cmp.mapping.scroll_docs(1),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Right>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])

			vim_item.menu = ({
				luasnip = "",
				buffer = "﬘",
				path = "⨒",
				calc = "",
				emoji = "ﲃ",
				greek = "",
				nvim_lua = "",
				nvim_lsp = "",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "calc" },
		{ name = "greek" },
		{ name = "emoji" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	view = {
		entires = "native",
	},
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline({
		["<Down>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					feedkeys.call(keymap.t("<Down>"), "n")
				end
			end,
		},
		["<Up>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					feedkeys.call(keymap.t("<Up>"), "n")
				end
			end,
		},
		["<Right>"] = {
			c = function()
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					feedkeys.call(keymap.t("<Right>"), "n")
				end
			end,
		},
	}),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		["<Down>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					feedkeys.call(keymap.t("<Down>"), "n")
				end
			end,
		},
		["<Up>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					feedkeys.call(keymap.t("<Up>"), "n")
				end
			end,
		},
		["<Right>"] = {
			c = function()
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					feedkeys.call(keymap.t("<Right>"), "n")
				end
			end,
		},
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
