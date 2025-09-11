{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [
        "JetBrainsMono Nerd Font"
      ];
    };
  };
}
