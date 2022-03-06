vim.g.completeopt = "menu,menuone,noselect,noinsert"

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

-- local lspkind = require'lspkind'

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load({ paths = "./lua/snippets" })
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
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
	mapping = {
		-- normal mode
		['<C-b>'] 		= cmp.mapping.scroll_docs(-2),
		['<C-f>'] 		= cmp.mapping.scroll_docs(4),
		['<C-e>'] 		= cmp.mapping {
											i = cmp.mapping.abort(),
											c = cmp.mapping.close()
										},
		['<CR>'] 			= cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
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
    end, {
      "i",
      "s",
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
		-- insert mode
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-j>'] 		= cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<C-k>'] 		= cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp', keyword_length = 2, max_item_count = 15 },
    { name = 'luasnip', max_item_count = 15 },
		{ name = 'buffer', keyword_length = 5, max_item_count = 3 },
		{ name = 'path', max_item_count = 3 }
	},
	formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Luasnip]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
	},
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
	experimental = {
		native_menu = false,
		ghost_text = false
	}
})
