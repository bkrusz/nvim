return {
  {
    'atiladefreitas/dooing',
    lazy = false,
    config = function()
      require('dooing').setup({
        nested_tasks = {
          move_completed_to_end = false,
        },
        formatting = {
          pending = {
            icon = '󰄱 ',
            format = { 'icon', 'notes_icon', 'text', 'due_date', 'ect' },
          },
          in_progress = {
            icon = '󰏬 ',
            format = { 'icon', 'text', 'due_date', 'ect' },
          },
          done = {
            icon = ' ',
            format = { 'icon', 'notes_icon', 'text', 'due_date', 'ect' },
          },
        },
        priorities = {
          {
            name = 'High',
            weight = 3
          },
          {
            name = 'Medium',
            weight = 2
          },
          {
            name = 'Low',
            weight = 1
          },
        },
        keymaps = {
          toggle_window = '<leader>tt',
          open_project_todo = '<leader>tT',
          new_todo = 'n',
          create_nested_task = 'N',
          toggle_todo = '<cr>',
        }
      })
    end
  }
}
