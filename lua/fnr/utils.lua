-- Imports

-- Module
local utils = {}

-- Constants
local a = vim.api
local ui = a.nvim_list_uis()[1]

-- Functions

local function round(flt)
    return math.floor(flt + 0.5)
end

local function create_window()
    local width = round(ui.width * 0.5)
    local height = 1

    local bufnr = a.nvim_create_buf(false, true)

    local winnr = a.nvim_open_win(bufnr, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = (ui.width - width) / 2,
        row = (ui.height - height) / 2,
        style = 'minimal',
        focusable = false,
        border = "double",
        title = "Find and Replace",
        title_pos = "center",
    })
    
    return {
        buffer = bufnr,
        win_id = winnr
    }
end


utils.initialize = function(opts)
    -- Record current buffer number
    local c_buf = a.nvim_get_current_buf()

    -- Create New Window
    local win_opt = create_window()

    -- Create onattach method to update search terms
    a.nvim_buf_attach(win_opt.buffer, true, {
        on_lines = function(lines)
            -- Parse String
            
        end
    })
end

return utils

