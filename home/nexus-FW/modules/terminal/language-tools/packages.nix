{ pkgs, ... }:

# C
# Go
# Python
# Rust
# Zig
{
  home.packages = with pkgs; [
    # C
    # clang
    # clang-tools
    gcc
    # Go
    go
    # Python
    python3
    # Rust
    cargo
    cargo-generate
    cargo-seek
    cargo-tauri
    clippy
    rust-analyzer
    rustc
    rustfmt
    rustlings
    # Zig
    zig
  ];
}
