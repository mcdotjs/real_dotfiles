return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({

      format_on_safe = {
        async = true,
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        --python = { "isort", "black" },
        javascript = { "prettier" },
        vue = { "prettier" },
        typescriptvue = { "prettier" },
        javascriptvue = { "prettier" },
        html = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--single-attribute-per-line",
            "--html-whitespace-sensitivity", "ignore",
            "--bracket-same-line", "false",
            "--vue-indent-script-and-style",
          },
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        async = true,
        timeout_ms = 500,
        lsp_fallback = true,
      })
    end)
  end,
}
