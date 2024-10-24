-- Configure formatter.nvim
require('formatter').setup({
  logging = true, -- Optional: Enable logging to help debug
  log_level = vim.log.levels.WARN,
  filetype = {
    php = {
      -- Use prettier as the formatter for PHP files, treating them as HTML
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), 
            "--parser", "html", -- Force Prettier to use the HTML parser
            "--single-quote"
          },
          stdin = true,
        }
      end
    },
    -- Add other filetypes as needed
    html = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
          stdin = true,
        }
      end
    },
    -- Add more filetypes like css, javascript, etc.
  }
})

