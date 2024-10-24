require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "omnisharp", "clangd", "pyright", "eslint", "cssls", "phpactor"},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

local border = 'rounded'

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
  ["textDocument/float_diagnostic"] =  vim.lsp.with(vim.lsp.handlers.float_diagnostic, {border = border }),
}
-- Set filetype to php.html for existing PHP files
-- vim.cmd("autocmd BufRead *.php set ft=php.html")
--
-- -- Set filetype to php.html for new PHP files
-- vim.cmd("autocmd BufNewFile *.php set ft=php.html")
--
-- lspconfig.phpactor.setup{
--     filetypes = {"php"},
--     root_dir = function (_)
--         return vim.loop.cwd()
--     end,
--     init_options = {
--         ["language_server_phpstan.enabled"] = false,
--         ["language_server_psalm.enabled"] = false,
--     }
-- }

lspconfig.intelephense.setup({
    root_dir = function (_)
        return vim.loop.cwd()
    end,
    capabilities = capabilities
})

lspconfig.emmet_ls.setup({
    filetypes = {"php"},
    capabilities = capabilities
})

lspconfig.cssls.setup({
    capabilities = capabilities
})
lspconfig.eslint.setup({
    capabilities = capabilities
})
lspconfig.ts_ls.setup({
    capabilities = capabilities
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            globals = {"vim"},
        }
    }
    }
})

lspconfig.omnisharp.setup({
    capabiltiies = capabilities
})

lspconfig.pyright.setup({
    capabilities = capabilities
})

lspconfig.clangd.setup({
    filetypes = {"c", "cpp", "h", "objc"},
    capabilities = capabilities,
    handlers = handlers,
})

require("clangd_extensions").setup  {
    server = {
            cmd = { "clangd",
                    "--query-driver='/usr/bin/gcc'",
                    }
        },
    -- bunch of other stuff for clangd_extentions customisation
}

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      { name = "buffer" },
    }),
})

-- local function goto_definition(split_cmd)
--   local util = vim.lsp.util
--   local log = require("vim.lsp.log")
--   local api = vim.api
--
--   -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
--   local handler = function(_, result, ctx)
--     if result == nil or vim.tbl_isempty(result) then
--       local _ = log.info() and log.info(ctx.method, "No location found")
--       return nil
--     end
--
--     if split_cmd then
--       vim.cmd(split_cmd)
--     end
--
--     if vim.tbl_islist(result) then
--       util.jump_to_location(result[1])
--
--       if #result > 1 then
--         -- util.set_qflist(util.locations_to_items(result))
--         vim.fn.setqflist(util.locations_to_items(result))
--         api.nvim_command("copen")
--         api.nvim_command("wincmd p")
--       end
--     else
--       util.jump_to_location(result)
--     end
--   end
--
--   return handler
-- end
--
-- vim.lsp.handlers["textDocument/definition"] = goto_definition('split')
vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

