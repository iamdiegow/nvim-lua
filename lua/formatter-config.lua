require('formatter').setup({
  logging = false,
  filetype = {
		json = {
			function()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
					stdin = true
				}
			end
		},
    javascript = {
		  function()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
					stdin = true
				}
			end
    },
    typescript = {
		  function()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
					stdin = true
				}
			end
    },
    javascriptreact = {
      function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    typescriptreact = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    }
  }
})

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx FormatWrite
augroup END
]], true)
