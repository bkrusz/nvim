return {
  {
    'bullets-vim/bullets.vim',
    lazy = false,
    init = function()
      vim.g.bullets_set_mappings = 0
      vim.g.bullets_custom_mappings = {
        { 'imap', '<cr>', '<Plug>(bullets-newline)'},
        { 'inoremap', '<C-cr>', '<cr>'},
        { 'nmap', 'o', '<Plug>(bullets-newline)'},
        { 'vmap', 'gN', '<Plug>(bullets-renumber)'},
        { 'nmap', 'gN', '<Plug>(bullets-renumber)'},
        { 'imap', '<Tab>', '<Plug>(bullets-demote)'},
        { 'nmap', '>>', '<Plug>(bullets-demote)'},
        { 'vmap', '>', '<Plug>(bullets-demote)'},
        { 'nmap', '<<', '<Plug>(bullets-promote)'},
        { 'vmap', '<', '<Plug>(bullets-promote)'},
        { 'imap', '<S-Tab>', '<Plug>(bullets-promote)'},
      }
      vim.g.bullets_delete_last_bullet_if_empty = 2
    end,
  }
}
