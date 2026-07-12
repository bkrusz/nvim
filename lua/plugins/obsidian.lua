return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = { 'markdown' },
    config = function()
      require('obsidian').setup({
        workspaces = {
          {
            name = 'PKM',
            path = '/Users/bailey/PKM'
          }
        },
        link = {
          format = 'relative',
          style = require('obsidian.link').wiki_link_alias_only,
        },
        daily_notes = {
          folder = 'daily_notes',
          date_format = '%Y-%m-%d',
          alias_format = '%B %-d, %Y',
          template = nil
        },
        completion = { min_chars = 1 },
        templates = { folder = 'templates' },
        note = { template = 'default.md' },
        new_notes_location = 'current_dir',
        note_id_func = require('obsidian.builtin').title_id,
        unique_note = { enabled = false },
        frontmatter = {
          enabled = true,
          func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
              for k,v in pairs(note.metadata) do
                out[k] = v
              end
            end
            return out
          end,
        },
        search = {
          sort_by = 'modified',
          sort_reversed = true
        },
        open_notes_in = 'current',
        checkbox = {
          enabled = true,
          create_new = true,
          order = { ' ', '/', 'x' }
        },
        ui = {
          enable = true,
          update_debounce = 200,
          -- checkboxes = {
          --   [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          --   ['/'] = { char = '󰏬', hl_group = 'ObsidianInProgress' },
          --   ['x'] = { char = '', hl_group = 'ObsidianDone' },
          -- },
          bullets = { char = '•', hl_group = 'ObsidianBullet' },
          external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
          reference_text = { hl_group = 'ObsidianRefText' },
          highlight_text = { hl_group = 'ObsidianHighlightText' },
          tags = { hl_group = 'ObsidianTag' },
          hl_groups = {
            ObsidianTodo = { bold = true, fg = '#f78c6c' },
            ObsidianDone = { bold = true, fg = '#03fc0b' },
            ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
            ObsidianTilde = { bold = true, fg = '#ff5370' },
            ObsidianInProgress = { bold = true, fg = '#fce803' },
            ObsidianRefText = { underline = true, fg = '#c792ea' },
            ObsidianExtLinkIcon = { fg = '#c792ea' },
            ObsidianTag = { italic = true, fg = '#89ddff' },
            ObsidianHighlightText = { bg = '#75662e' },
            ObsidianBullet = { bold = true, fg = '#d47766'}
          },
        },
        attachments = {
          folder = '/Users/bailey/PKM/assets/imgs',
          -- A function that determines the text to insert in the note when pasting an image
          --- @param client obsidian.Client
          --- @param path Path the absolute path to the image file
          --- @return string
          img_text_func = function(client, path)
            local link_path
            local vault_relative_path = client:vault_relative_path(path)
            if vault_relative_path ~= nil then
              -- Use relative path if the image is saved in the vault dir
              link_path = vault_relative_path
            else
              link_path = tostring(path)
            end
            local display_name = vim.fs.basename(link_path)
            return string.format('![%s](%s)', display_name, link_path)
          end,
        },
        yaml_parser = 'native',
        legacy_commands = false,
      })
    end
  }
}
