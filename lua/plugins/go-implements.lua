return {
  "maxandron/goplements.nvim",
  ft="go",
  opts={
      prefix = {
        interface = "implemented by: ",
        struct = "implements: ",
      },
      -- Whether to display the package name along with the type name (i.e., builtins.error vs error)
      display_package = false,
      -- The namespace to use for the extmarks (no real reason to change this except for testing)
      namespace_name = "goplements",
      -- The highlight group to use (if you want to change the default colors)
      -- The default links to DiagnosticHint
      highlight = "Goplements",
  }
}
