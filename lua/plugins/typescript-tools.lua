return {
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client, bufnr)
        vim.keymap.set(
          "n",
          "<leader>lo",
          "<cmd>TSToolsOrganizeImports<cr>",
          { buffer = bufnr, desc = "Organize Imports" }
        )
        vim.keymap.set("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>", { buffer = bufnr, desc = "Sort Imports" })
        vim.keymap.set("n", "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>", { buffer = bufnr, desc = "Removed Unused" })
        vim.keymap.set(
          "n",
          "<leader>lz",
          "<cmd>TSToolsGoToSourceDefinition<cr>",
          { buffer = bufnr, desc = "Go To Source Definition" }
        )
        vim.keymap.set(
          "n",
          "<leader>lR",
          "<cmd>TSToolsRemoveUnusedImports<cr>",
          { buffer = bufnr, desc = "Removed Unused Imports" }
        )
        vim.keymap.set("n", "<leader>lF", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
        vim.keymap.set(
          "n",
          "<leader>lA",
          "<cmd>TSToolsAddMissingImports<cr>",
          { buffer = bufnr, desc = "Add Missing Imports" }
        )
        vim.keymap.set(
          "n",
          "<leader>lr",
          "<cmd>TSToolsFileReferences<cr>",
          { buffer = bufnr, desc = "Find File [r]eferences" }
        )
      end,
      settings = {
        tsserver_file_preferences = {
          -- includeInlayParameterNameHints = "all",
          -- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          -- includeInlayFunctionParameterTypeHints = true,
          -- includeInlayVariableTypeHints = true,
          -- includeInlayPropertyDeclarationTypeHints = true,
          -- includeInlayFunctionLikeReturnTypeHints = true,
          -- includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}
