-- return {
--   "wuelnerdotexe/vim-astro",
--   config = function()
--     require("vim-astro").setup({
--       options = {
--         astro_typescript = "enable",
--       },
--     })
--   end,
-- }
return {
  { "wuelnerdotexe/vim-astro" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarizedDark",
    },
  },
}
