{ pkgs, ... }:

# Clang
# Go
# Python
# Rust
# Zig
{
  home.packages = with pkgs; [
    # Clang
    clang
    clang-tools
    # Go
    go
    # Python
    python3
    uv
    # Rust
    cargo
    cargo-generate
    cargo-seek
    clippy
    rust-analyzer
    rustc
    rustfmt
    rustlings
    # Zig
    zig
  ];
}
