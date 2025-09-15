{ username, ...}:

{
  fileSystems."/home/${username}/Ram" = {
    device = "tmpfs";
    fsType  = "tmpfs";
    options = [ "size=60G" "mode=0775" "nosuid" "nodev" "noatime" ];
  };
  systemd.tmpfiles.rules = [
    # "d <path> <mode> <user> <group> <age>"
    "d /home/${username}/Ram 0775 ${username} users -"
  ];
}
