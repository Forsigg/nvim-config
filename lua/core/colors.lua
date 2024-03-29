vim.opt.termguicolors = true
vim.opt.background = 'dark'

function SetColor(color)
	color = color or 'darcula-solid'
	vim.cmd.colorscheme(color)
	
	-- vim.api.nvim_set_hl(0, 'Normal', {bg = '#120E27'})
	-- vim.api.nvim_set_hl(0, 'NormalFloat', {bg = '#0E0A23'})
	-- vim.api.nvim_set_hl(0, 'ColorColumn', {bg = 'none'})
	-- vim.api.nvim_set_hl(0, 'LineNr',  {bg = 'none'})
end

function SetDebugIcons()
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

    vim.fn.sign_define('DapBreakpoint', { text='⚫', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
end

SetColor()
SetDebugIcons()
