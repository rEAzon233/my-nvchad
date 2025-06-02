require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Telescope
map("n", "<leader>fd", function()
    require("telescope.builtin").lsp_definitions({ reuse_win = true })
end, { desc = "Find definition" })
map("n", "<leader>fr", function()
    require("telescope.builtin").lsp_references({ reuse_win = true })
end, { desc = "References", nowait = true })
map("n", "<leader>fi", function()
    require("telescope.builtin").lsp_implementations({ reuse_win = true })
end, { desc = "Find implementation" })
map("n", "<leader>ft", function()
    require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end, { desc = "Find type definition" })
map("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- LSP
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Diagnostics
map("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to previous warning" })

map("n", "]w", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to next warning" })

map("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to previous error" })

map("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to next error" })

--Blame
map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { silent = true, desc = "Toggle git blame", nowait = true })
