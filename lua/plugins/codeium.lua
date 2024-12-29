return {

  {
    "Exafunction/codeium.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Codeium" },

    config = function()
      require("codeium").setup({
        virtual_text = {
          enabled = true,
        },
        enable_chat = true,
        enable_cmp_source = true,
      })
    end,
  },
}
