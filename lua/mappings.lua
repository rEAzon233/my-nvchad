require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Telescope
map("n", "<leader>gb", function()
    require("telescope.builtin").buffers({
        ignore_current_buffer = false,
        show_all_buffers = true,
        sort_mru = true,
    })
end, { desc = "Open buffers" })
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

-- Gopher
map("n", "<leader>gta", ":GoTagAdd json<CR>", { desc = "Add Go JSON tags", silent = true })
map("n", "<leader>gtd", ":GoTagRm json<CR>", { desc = "Delete Go JSON tags", silent = true })
map("n", "<leader>gi", ":GoIfErr<CR>", { desc = "Generate Go err", silent = true })

-- Diagnostics
map("n", "<leader>do", function()
    require("telescope.builtin").diagnostics({ reuse_win = true })
end, { desc = "Open diagnostics" })
map("n", "[w", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to previous warning" })
map("n", "]w", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to next warning" })
map("n", "[e", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to previous error" })
map("n", "]e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to next error" })

--Blame
map("n", "<leader>gob", "<cmd>GitBlameToggle<cr>", { silent = true, desc = "Toggle git blame", nowait = true })
