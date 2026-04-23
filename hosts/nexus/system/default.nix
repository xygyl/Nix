{
  imports = [
    ../../common/system/env.nix
    ../../common/system/firewall.nix
    ../../common/system/greetd.nix
    ../../common/system/network.nix
    ../../common/system/nh.nix
    ../../common/system/root.nix
    ../../common/system/timezone.nix
    ../../common/system/user.nix
    ../../common/system/boot.nix
    ./fs.nix
    ./openrgb.nix
    ./packages.nix
    ./system.nix
  ];
}
