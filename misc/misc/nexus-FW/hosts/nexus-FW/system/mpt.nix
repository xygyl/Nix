{ pkgs, username, ...}:

{
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    simple-mtpfs
    jmtpfs
    gvfs
  ];

  users.users.${username}.extraGroups = [ "plugdev" "disk" "users" ];
}
