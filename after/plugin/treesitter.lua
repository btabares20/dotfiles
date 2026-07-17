require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'javascript', 'zig' , 'python'}
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)

    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf)
    end
  end,
})

