{ pkgs, ...}:

{
  home.packages = with pkgs; [
    kdlfmt
    nil
    ruff
    tinymist
    vscode-css-languageserver

    # TOML
    taplo
    tombi
  ];
}
