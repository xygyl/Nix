{ username, pkgs, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "audio" "networkmanager" "wheel" "video" ];
    shell = pkgs.nushell;
  };
}
