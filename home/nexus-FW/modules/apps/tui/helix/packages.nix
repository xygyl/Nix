{ pkgs, ...}:
# CSS
# Go
# HTML
# Javascript
# KDL
# Lua
# Markdown
# Nix
# Python
# TOML
# Typescript
# Typst
# Zig
{
  home.packages = with pkgs; [
    lldb
    vscode-langservers-extracted

    # Go
    delve
    golangci-lint
    golangci-lint-langserver
    gopls
    # HTML
    superhtml
    # Javascript
    typescript-language-server
    nodejs
    # KDL
    kdlfmt
    # Lua
    lua-language-server
    # Markdown
    markdown-oxide
    marksman
    # Nix
    nil
    nixd
    # Python
    ruff
    ty
    uv
    # TOML
    taplo
    tombi
    # Typescript
    nodePackages.typescript
    # Typst
    tinymist
    # Zig
    zls
  ];
}
