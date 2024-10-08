-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- Se the kickstart.nvim README for more information

return {
  { 'xiyaowong/transparent.nvim' },
  -- lightspeed search
  {'ggandor/lightspeed.nvim'},
  -- git
  {'https://github.com/tpope/vim-fugitive'},
  {'sodapopcan/vim-twiggy'},
  {'junegunn/gv.vim'},
  -- {'tpope/vim-rhubarb'},
    --switch true/false
  {'andrewradev/switch.vim',
    vim.keymap.set("n", "gs", "<cmd>Switch<CR>" , { silent = true, desc = 'Switch True/False' })
  },
  --persistance
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  --terminal
  -- {'akinsho/toggleterm.nvim'},
  -- undo tree
  {'mbbill/undotree',
    config = function ()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'ToggleUndoTree' })
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" },   -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
        keys = "<Esc>",             -- keys used for escaping, if it is a funct
      })
    end,
  },
  -- multi line 
  {'mg979/vim-visual-multi'},
  -- close tag
  -- {'alvan/vim-closetag'},
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
    -- Swap
  -- {'mizlan/iswap.nvim'},
}
