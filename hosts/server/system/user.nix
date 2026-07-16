{ pkgs, ... }:

{
  users.users.server = {
    isNormalUser = true;
    extraGroups = [ "audio" "networkmanager" "wheel" "video" ];
    shell = pkgs.nushell;
  };

  users.users.root.shell = pkgs.nushell;
}
