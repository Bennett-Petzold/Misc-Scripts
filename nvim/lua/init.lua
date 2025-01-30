require('mason').setup()
require('mason-lspconfig').setup()
require('nvim-lightbulb').setup({ autocmd = { enabled = true } })

-- require('rust-tools').setup()

require('nlspsettings').setup({
	config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers_fallback = { '.git' },
	append_default_schemas = true,
	loader = 'json'
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local common_setup_opts = {
	-- on_attach = my_custom_on_attach,
	capabilities = capabilities,
}

local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = global_capabilities,
})

--[[
require("mason_lspconfig").setup_handlers({
  function (server_name)
    lspconfig[server_name].setup({
      -- on_attach = on_attach,
		capabilities = capabilities,
    })
  end
})
--]]

-- :h mason-lspconfig-automatic-server-setup
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
			-- on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}
-- lspconfig setup
-- Setup language servers.
--[[
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.jedi_language_server.setup {}
lspconfig.tsserver.setup {}
lspconfig.texlab.setup {}
lspconfig.svls.setup {}
lspconfig.jqls.setup {}
--]]

-- quickfix lists
require("diaglist").init({
	-- optional settings
	-- below are defaults
	debug = false,

	-- increase for noisy servers
	debounce_ms = 150,
})

-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gs', function()
			vim.cmd([[split]])
			vim.lsp.buf.definition()
			vim.cmd([[sleep 100m]])
			vim.cmd([[wincmd p]])
		end, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-]>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts) -- secondary binding
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets
-- Add additional capabilities supported by nvim-cmp
-- local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
--local servers = { 'clangd', 'rust_analyzer', 'jedi_language_server', 'tsserver', 'jdtls', 'bashls', 'texlab', 'svls', 'jqls' }
--for _, lsp in ipairs(servers) do
--	lspconfig[lsp].setup {
-- on_attach = my_custom_on_attach,
--		capabilities = capabilities,
--	}
--end

--[[
function Rustfmt()
	require("rust-tools").setup({
		tools = {
			hover_actions = {
				auto_focus = true,
			}
		},
		server = {
			on_attach = function(_, bufnr)
			end,
			capabilities = capabilities,
		}
	})
end

function Clippy()
	require("rust-tools").setup({
		tools = {
			hover_actions = {
				auto_focus = true,
			}
		},
		server = {
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
						-- Don't build in regular target dir
						targetDir = true
					},
					check = {
						command = "clippy",
						overrideCommand = 'cargo clippy --workspace --message-format=json --all-targets --all-features'
					},
				}
			},
			on_attach = function(_, bufnr)
			end,
			capabilities = capabilities,
		}
	})
end

Clippy()

vim.api.nvim_create_user_command('Clippy', Clippy, {});
vim.api.nvim_create_user_command('Rustfmt', Rustfmt, {});
--]]

--[[
lspconfig['rust_analyzer'].setup {
	on_attach =
	capabilities = capabilities,
}
--]]

function Rustfmt()
	vim.g.rustaceanvim = {
		tools = {
			hover_actions = {
				auto_focus = true,
			}
		},
		server = {
			on_attach = function(_, bufnr)
			end,
			capabilities = capabilities,
		}
	}
	pcall(vim.cmd, "RustAnalyzer reloadSettings")
end

function Clippy()
	vim.g.rustaceanvim = {
		tools = {
			hover_actions = {
				auto_focus = true,
			}
		},
		server = {
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
						-- Don't build in regular target dir
						targetDir = true
					},
					check = {
						command = "clippy",
						overrideCommand = 'cargo clippy --workspace --message-format=json --all-targets --all-features'
					},
				}
			},
			on_attach = function(_, bufnr)
			end,
			capabilities = capabilities,
		}
	}
	pcall(vim.cmd, "RustAnalyzer reloadSettings")
end

Clippy()

vim.api.nvim_create_user_command('Clippy', Clippy, {});
vim.api.nvim_create_user_command('Rustfmt', Rustfmt, {});

-- luasnip setup
local luasnip = require 'luasnip'
--- Don't keep memory of old tabs: https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
vim.api.nvim_create_autocmd('ModeChanged', {
	pattern = '*',
	callback = function()
		if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
			and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require('luasnip').session.jump_active
		then
			require('luasnip').unlink_current()
		end
	end
})

-- Friendly snippets setup
require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-o>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			--if cmp.visible() then
			--  cmp.select_next_item()
			--elseif luasnip.expand_or_jumpable() then
			--if luasnip.expand_or_jumpable() then
			--	luasnip.expand_or_jump()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			--if cmp.visible() then
			--	cmp.select_prev_item()
			--elseif luasnip.jumpable(-1) then
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp', priority = 90 },
		{ name = 'luasnip',  priority = 100 },
		-- { name = 'nvim_lsp' },
		-- { name = 'luasnip' },
	},
	-- Disable preselect requests from LSPs
	completion = { completeopt = "noselect" },
	preselect = cmp.PreselectMode.None,
}

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- Enable quickfix list
--  update_in_insert = false
--})

--vim.cmd("command! ShowDiagnostics lua vim.lsp.diagnostic.set_loclist({ open = true })")
--vim.cmd("command! ShowDiagnostics lua require('vim.diagnostic').open({})")
-- vim.cmd("command! ShowDiagnostics lua require('vim.lsp.util').show_line_diagnostics({ focusable = false })")

require('custom-snippets')

-- https://stackoverflow.com/questions/67988374/neovim-lsp-auto-fix-fix-current/74303272#74303272
-- https://www.reddit.com/r/neovim/comments/j2ny8b/comment/g76ogzr/
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/handlers.lua

require("project_nvim").setup {}
