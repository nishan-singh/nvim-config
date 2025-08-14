return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "jsx",
  },
}
