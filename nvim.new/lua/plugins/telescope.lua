local M = {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  cmd = { "Telescope" },
  dependencies = {
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    "nvim-telescope/telescope-github.nvim"
  }
}

function M.config()
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    },
    defaults = {
      preview = {
        mime_hook = function(filepath, bufnr, opts)
          local is_image = function(filepath)
            local image_extensions = {'png','jpg', 'gif'}   -- Supported image formats
            local split_path = vim.split(filepath:lower(), '.', {plain=true})
            local extension = split_path[#split_path]
            return vim.tbl_contains(image_extensions, extension)
          end
          if is_image(filepath) then
            local term = vim.api.nvim_open_term(bufnr, {})
            local function send_output(_, data, _ )
              for _, d in ipairs(data) do
                vim.api.nvim_chan_send(term, d..'\r\n')
              end
            end
            vim.fn.jobstart(
              {
                'chafa', '-s=80x30', filepath  -- Terminal image viewer command
              },
              {on_stdout=send_output, stdout_buffered=true})
          else
            require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
          end
        end
      },
    },
    -- cant get the below to work, so disabling it
    -- pickers = {
    --   find_files = {
    --     mappings = {
    --       n = {
    --         ["cd"] = function(prompt_bufnr)
    --           local selection = require("telescope.actions.state").get_selected_entry()
    --           local dir = vim.fn.fnamemodify(selection.path, ":p:h")
    --           require("telescope.actions").close(prompt_bufnr)
    --           -- Depending on what you want put `cd`, `lcd`, `tcd`
    --           vim.cmd(string.format("silent cd %s", dir))
    --         end
    --       }
    --     }
    --   },
    -- }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('gh')
end

return M
