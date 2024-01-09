return {
  "rafamadriz/friendly-snippets",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    -- Load snippets
    require("luasnip.loaders.from_vscode")
    require("luasnip.loaders.from_snipmate")

    -- Load custom javascript
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/typescript" } })

    -- ls.filetype_extend("all", { "_" })
  end,
}
