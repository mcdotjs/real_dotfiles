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
        ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "cssls", "html", "gopls", "clangd", "elixirls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    blinkDependencies = { "saghen/blink.cmp" },
    dependencies = {
      "folke/lazydev.nvim",

      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,      -- Enable virtual text
        signs = true,             -- Enable signs
        underline = true,         -- Enable underline
        update_in_insert = false, -- Do not update diagnostics in insert mode
        severity_sort = true,     -- Sort diagnostics by severity
        float = {
          border = "rounded",
        },
      })
      local lspconfig = require("lspconfig")
      local capabilitiesBlink = require("blink.cmp").get_lsp_capabilities()
      capabilitiesBlink.window = {
        completion = {
          border = "rounded",
        },
      }
      lspconfig.lua_ls.setup({ capabilities = capabilitiesBlink })
      lspconfig.ts_ls.setup({
        capabilities = capabilitiesBlink,
        settings = {
          virtual_text = true,
        },
        filetypes = { "javascript", "typescript", "vue" },
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = os.getenv("HOME")
                  .. "/.nvm/versions/node/v20.11.1/lib/node_modules/@vue/typescript-plugin",
              --.. "/.nvm/versions/node/v22.16.0/bin/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        format = {
          template = {
            wrapattributes = "force-expand-multiline",
          },
        },
      })
      --
      lspconfig.tailwindcss.setup({ capabilities = capabilitiesBlink })
      lspconfig.prismals.setup({ capabilities = capabilitiesBlink })
      lspconfig.cssls.setup({ capabilities = capabilitiesBlink })
      lspconfig.html.setup({
        filetypes = { "vue", "html" },
        capabilities = capabilitiesBlink,
        settings = {
          html = {
            format = {
              enable = true,
              wrapAttributes = "force-expand-multiline",
              --wrapLineLength = 80, -- Very short to force wrapping
              --indentInnerHtml = true,
              -- indentHandlebars = false,
              -- endWithNewline = false,
              insertFinalNewline = true,
              maxPreserveNewLines = 2,
              vueIndentScriptAndStyle = true,
              bracketSpacing = true,
            },
          },
        },
      })

      lspconfig.pylsp.setup({ capabilities = capabilitiesBlink })
      lspconfig.gopls.setup({ capabilities = capabilitiesBlink })
      lspconfig.elixirls.setup({
        -- cmd = { "/home/mirko/.asdf/shims/elixir" },
        cmd = { "elixir-ls" },
        capabilities = capabilitiesBlink,
      })
      lspconfig.clangd.setup({
        capabilities = capabilitiesBlink,

        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          -- NOTE: clangd format file
          --"--fallback-style=llvm",
        },
      })
      lspconfig.glsl_analyzer.setup({ capabilities = capabilitiesBlink })

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
