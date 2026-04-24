{
  imports = [
    ../../../common/modules/terminal/emulators
    ../../../common/modules/terminal/git.nix
    ../../../common/modules/terminal/language-tools
    ../../../common/modules/terminal/nushell
    ./nushell/config.nix
    ./packages.nix
  ];
}
