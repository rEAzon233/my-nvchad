-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "nightowl",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "██████╗ ███████╗ █████╗ ███████╗",
        "██╔══██╗██╔════╝██╔══██╗╚══███╔╝",
        "██████╔╝█████╗  ███████║  ███╔╝ ",
        "██╔══██╗██╔══╝  ██╔══██║ ███╔╝  ",
        "██║  ██║███████╗██║  ██║███████╗",
        "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝",
    },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufDelete", "FileType" }, {
    callback = function(args)
        if args.event == "FileType" then
            vim.o.showtabline = vim.bo.ft == "nvdash" and 0 or 2
            return
        end

        local buf = args.buf

        if not vim.bo[buf].buflisted then
            return
        end

        vim.schedule(function()
            if #vim.t.bufs == 1 and vim.api.nvim_buf_get_name(buf) == "" then
                vim.cmd("Nvdash")
            end
        end)
    end,
})
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
