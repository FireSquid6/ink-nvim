

local wk = require("which-key")

-- LSP keybindings are in lua/lsp.lua
--
wk.register({
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find Files"},
    w = { "<cmd>Telescope live_grep<cr>", "Find Words"},
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers"},
    l = { "<cmd>Telescope lsp_document_symbols<cr>", "Search LSP"},
    c = { "<cmd>Telescope commands<cr>", "Search Commands"},
  },
  w = { "<cmd>wa<cr>", "Write Files"},
  q = { "<cmd>q<cr>", "Quit Files"},
  c = { "<cmd>bdelete<cr>", "Close Buffer"},
  [";"] = { "<cmd>TermSelect<cr>", "Select Terminal"},
  t = {
    name = "Terminal",
    ["1"] = { "<cmd>1ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 1"},
    ["2"] = { "<cmd>2ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 2"},
    ["3"] = { "<cmd>3ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 3"},
    f = { "<cmd>4ToggleTerm direction=float size=20<cr>", "Floating Terminal"}
  },
  g = { "<cmd>LazyGit<cr>", "LazyGit" },
}, { prefix = "<leader>"})


vim.keymap.set('t', "<C-n>", "<C-\\><C-n>")


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    wk.register({
      D = { vim.lsp.buf.declaration, "Go to Declaration", opts },
      d = { vim.lsp.buf.definition, "Go to Definition", opts },
      i = { vim.lsp.buf.implementation, "Go to Implementation", opts },
      r = { vim.lsp.buf.references, "Go to References", opts },
    }, { prefix = "g" })

    wk.register({
      l = {
        name = "LSP",
        a = { vim.lsp.buf.code_action, "Code Action", opts },
        n = { vim.lsp.buf.rename, "Rename", opts },
        f = { vim.lsp.buf.formatting, "Format", opts },
        d = { vim.lsp.diagnostic.show_line_diagnostics, "Line Diagnostics", opts },
        t = { vim.lsp.buf.type_definition, "Type Definition", opts },
      }
    }, { prefix = "<leader>" })
  end,
})
