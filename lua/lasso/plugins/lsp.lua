-- do not know if calling vim.pack.add in different files is ok
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" }
})

-- LSP CONFIG
local lspconf = require("lspconfig")
local fzf = require("fzf-lua")
local blink = require("blink.cmp")

local capabilities = blink.get_lsp_capabilities()

-- list of all language servers to enable
local servers = {
	"lua_ls",
	"pyright",
	"cssls"
}

local default_config = {
	capabilities = capabilities
}

local server_settings = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" } -- remove the undefined global vim warning
				}
			}
		}
	}
	-- add configs for other servers if you need
}

for _, server in ipairs(servers) do
	local server_config = vim.tbl_deep_extend("force", default_config, server_settings[server] or {})

	lspconf[server].setup(server_config)
end

-- DIAGNOSTICS
vim.diagnostic.config({
	severity_sort = true,
	underline = { severity = vim.diagnostic.severity.ERROR },

	float = {
		border = "single",
		source = "if_many",
	},
	virtual_text = true
})

-- AUTOCOMPLETION
blink.setup({
	keymap = {
		preset = "super-tab",
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
	},
	completion = {
		menu = { border = "single" },
		documentation = {
			window = { border = "single" },
			auto_show = true,
		},
	},
	signature = { window = { border = "single" } },
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer"
		},
	},
	fuzzy = { implementation = "lua" }
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),

	callback = function(event)
		local km = vim.keymap
		local opts = { buffer = event.buf, silent = true }

		opts.desc = "show code actions with fzf-lua"
		km.set("n", "<leader>ca", function() fzf.lsp_code_actions() end, opts)

		opts.desc = "goto references"
		km.set("n", "<leader>gr", function() fzf.lsp_references() end, opts)

		opts.desc = "goto definition"
		km.set("n", "<leader>gd", function() fzf.lsp_definitions() end, opts)

		opts.desc = "goto declaration"
		km.set("n", "<leader>gD", function() fzf.lsp_declarations() end, opts)

		opts.desc = "show diagnostics with fzf lua"
		km.set("n", "<leader>sg", function() fzf.lsp_document_diagnostics() end, opts)
	end
})

