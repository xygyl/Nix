{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo
    clang
    clang-tools
    clippy
    rust-analyzer
    rustc
    rustfmt
    rustlings
  ];
}
