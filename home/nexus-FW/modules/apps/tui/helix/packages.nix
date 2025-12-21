{ pkgs, ...}:
    # Go
    # KDL
    # Markdown
    # Nix
    # Python
    # TOML
    # Typst

{
  home.packages = with pkgs; [
    lldb
    lua-language-server
    vscode-css-languageserver
    vscode-json-languageserver

    # Go
    delve
    golangci-lint-langserver
    gopls
    # KDL
    kdlfmt
    # Markdown
    markdown-oxide
    marksman
    # Nix
    nil
    nixd
    # Python
    ruff
    ty
    # TOML
    taplo
    tombi
    # Typst
    tinymist
    # Zig
    zls
  ];
}
