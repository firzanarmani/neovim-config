local utils = {
	cmd = vim.cmd,
	fn = vim.fn,
  api = vim.api,
  
	execute = vim.api.nvim_command,
  replace_termcodes = vim.api.nvim_replace_termcodes,

	o = vim.o, -- Global options
	bo = vim.bo, -- Buffer-scoped options
	wo = vim.wo, -- Window-scoped options

  set_keymap = vim.api.nvim_set_keymap,
  buf_set_keymap = vim.api.nvim_buf_set_keymap
}

return utils
