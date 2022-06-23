return {
  handlers = {
    ['textDocument/publishDiagnostics'] = function(...) end
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}
