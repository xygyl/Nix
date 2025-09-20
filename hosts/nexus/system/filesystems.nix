{ username, ...}:

{
  systemd.tmpfiles.rules = [
    # "d <path> <mode> <user> <group> <age>"
    "d /home/${username}/Ram 0775 ${username} users -"
  ];

  fileSystems = {
    "/home/${username}/Ram" = {
      device = "tmpfs";
      fsType  = "tmpfs";
      options = [ "size=30G" "mode=0775" "nosuid" "nodev" "noatime" ];
    };
    
    "/home/${username}/Archive1" = {
      device = "PARTUUID=750863ec-d1ed-e44c-9084-5241f266e971";
      fsType = "btrfs";
      options = [ "rw" "relatime" "discard=async" "space_cache=v2" "subvol=/" ];
    };

    "/home/${username}/Archive2" = {
      device = "PARTUUID=76991c8d-2d04-43b0-b8e2-9100cd0ac901";
      fsType = "btrfs";
      options = [ "rw" "relatime" "ssd" "discard=async" "space_cache=v2" "subvol=/" ];
    };

    "/home/${username}/Archive3" = {
      device = "PARTUUID=d19d3c30-c11a-404b-88a6-078afa40c2a7";
      fsType = "btrfs";
      options = [ "rw" "relatime" "space_cache=v2" "subvol=/" ];
    };
  };
}
