return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "VeryLazy" },
  branch = "v3",
  init = function()
    require("ibl").setup()
  end,
}
