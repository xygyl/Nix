{ pkgs, ...}:

{
  home.packages = with pkgs; [
    lldb
    lua-language-server
    vscode-css-languageserver
    vscode-json-languageserver

    # KDL
    kdlfmt
    # Nix
    nil
    nixd
    # Python
    ruff
    # TOML
    taplo
    tombi
    # Typst
    tinymist
  ];
}
