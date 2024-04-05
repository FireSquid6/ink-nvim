

local wk = require("which-key")

local mappings = {
  {"n", "<leader>w", "<cmd>wa<cr>", "Write File"},
  {"n", "<leader>q", "<cmd>q<cr>", "Quit File"},
  -- Telescope
  {"n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files"},
  {"n", "<leader>fw", "<cmd>Telescope live_grep<cr>", "Find Words"},
  {"n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Find Buffers"},
  {"n", "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", "Search LSP"},
  {"n", "<leader>fc", "<cmd>Telescope commands<cr>", "Search Commmands"},
}

-- LSP keybindings are in lua/lsp.lua



for _, map in pairs(mappings) do
  vim.api.nvim_set_keymap(map[1], map[2], map[3], {noremap = true, silent = true, desc=map[4]})
end
