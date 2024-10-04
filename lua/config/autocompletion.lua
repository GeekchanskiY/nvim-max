local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept currently selected item
		["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		--	elseif vim.fn["vsnip#available"](1) == 1 then
	    --    feedkey("<Plug>(vsnip-expand-or-jump)", "")
	    --  elseif has_words_before() then
	    --    cmp.complete()
	      else
	        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	      end
	    end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		}),

	matching = { disallow_symbol_nonprefix_matching = false },

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "go_pkgs" },
		{ name = "cmp_tabnine" },
		{ name = "sql" },
		{ name = "ts_ls" },
	}),

})

-- lspconfig setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['gopls'].setup {
    capabilities = capabilities,
	settings = {
		gopls = {
			buildFlags = {"-tags=units"}
		}
	}
}

require('lspconfig')['ts_ls'].setup {
    capabilities = capabilities,
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}


require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
	on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
		  "${3rd}/luv/library"
        }
      }
    })
  end,
  settings = {
    Lua = {}
  },
}

-- cmd line setup
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
