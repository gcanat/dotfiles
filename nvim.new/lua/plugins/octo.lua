local octo = {
  'pwntester/octo.nvim',
  dependencies = {
     'nvim-telescope/telescope.nvim',
  },
  config = function ()
    require('octo').setup()
  end,
  cmd = { "Octo" },
}

return octo
