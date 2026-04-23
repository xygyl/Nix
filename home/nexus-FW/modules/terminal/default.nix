{
  imports = [
    ../../../common/modules/terminal/git.nix
    ../../../common/modules/terminal/language-tools
    ../../../common/modules/terminal/nushell
    ../../../common/modules/terminal/emulators
    ./nushell/config.nix
    ./packages.nix
    ./kitty.nix
  ];
}
