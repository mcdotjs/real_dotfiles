return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "volar", "ts_ls", "tailwindcss", "cssls", "html" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilitiesDefault = require("cmp_nvim_lsp").default_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        --			cmd = lsp_containers.command("tsserver"),
        filetypes = { "javascript", "typescript", "vue" },
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/home/mirko/.nvm/versions/node/v20.11.1/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
      })

      lspconfig.tailwindcss.setup({})
      lspconfig.prismals.setup({})
      lspconfig.cssls.setup({})
      lspconfig.html.setup({
        filetypes = { "vue" },
        capabilities = capabilitiesDefault,
      })
      lspconfig.pylsp.setup({})
      --Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      --vim.keymap.set("n", "gR", vim.lsp.buf.references, { desc = "[g]o to [R]eferences" })
      --vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[g]o to [I]mplementations" })
      --vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame .. dont know what at the moment" })
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[g]o to [R]eferences" })
      vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[g]o to [D]efinitions" })
      vim.keymap.set(
        "n",
        "gI",
        require("telescope.builtin").lsp_implementations,
        { desc = "[g]o to [I]mplementations" }
      )
      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      vim.keymap.set(
        "n",
        "<leader>D",
        require("telescope.builtin").lsp_type_definitions,
        { desc = "Type [D]efinitions" }
      )
      vim.keymap.set(
        "n",
        "ds",
        require("telescope.builtin").lsp_document_symbols,
        { desc = "searching [d]ocument [s]ymbols" }
      )
      vim.keymap.set(
        "n",
        "ws",
        require("telescope.builtin").lsp_dynamic_workspace_symbols,
        { desc = "searching [w]orkspace [s]ymbols" }
      )
    end,
  },
}
