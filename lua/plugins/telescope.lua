return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup ({
        defaults = {
          file_ignore_patterns = { 'build/' }
        }
      })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = false,
    config = function()
      require('telescope').setup ({})
      require('telescope').load_extension('ui-select')
    end
  },
}
