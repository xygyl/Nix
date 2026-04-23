{ username, ... }:

{
  fileSystems."/home/${username}/Ram" = {
    device = "tmpfs";
    fsType  = "tmpfs";
    options = [ "size=2G" "mode=0775" "nosuid" "nodev" "noatime" ];
  };
  systemd.tmpfiles.rules = [
    "d /home/${username}/Ram 0775 ${username} users -"
  ];
}
