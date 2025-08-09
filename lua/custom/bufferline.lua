return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        -- Basic configuration
        mode = "buffers", -- "buffers" | "tabs" | "windows"
        numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both"
        close_command = "bdelete! %d", -- Command to close buffer
        right_mouse_command = "bdelete! %d", -- Right-click to close
        left_mouse_command = "buffer %d", -- Left-click to switch
        middle_mouse_command = nil, -- Middle-click to close
        indicator = {
          icon = '▎', -- Buffer indicator
          style = 'icon', -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        -- Name formatting
        name_formatter = function(buf) -- buf: buffer
          return buf.name              -- Use full path
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,

        -- Diagnostics
        diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return icon .. count
        end,

        -- Customization
        offsets = {
          {
            filetype = "Neotree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },

        -- Sorting
        sort_by = 'insert_after_current', -- 'insert_at_end' | 'insert_after_current' | 'id' | 'extension' | 'relative_directory' | 'directory'
      }
    })

    -- Key mappings
    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle pin' })
    vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Delete non-pinned buffers' })
    vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
    vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Close buffers to the right' })
    vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Close buffers to the left' })
    vim.keymap.set('n', '<leader>bs', '<Cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
    vim.keymap.set('n', '<leader>bS', '<Cmd>BufferLineSortByTabs<CR>', { desc = 'Sort by tabs' })
    
    for i = 1, 9 do
      vim.keymap.set('n', ('<leader>%d'):format(i), function()
        require('bufferline').go_to_buffer(i)
      end, { desc = ('Go to buffer %d'):format(i) })
    end
    -- Move current buffer
    vim.keymap.set('n', '<A-Left>', '<Cmd>BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<A-Right>', '<Cmd>BufferLineMoveNext<CR>')
  end
}

