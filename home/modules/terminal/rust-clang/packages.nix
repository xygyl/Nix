{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo
    cargo-seek
    clang
    clang-tools
    clippy
    rust-analyzer
    rustc
    rustfmt
    rustlings
  ];
}
