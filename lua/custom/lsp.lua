vim.lsp.enable { "clangd", "emmet-language-server", "gopls", "lua-language-server", }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { buffer = ev.buf, desc = "Go to definition" })
    end
  end,
})
