{
  imports = [
    ../../common/system/boot.nix
    ../../common/system/env.nix
    ../../common/system/greetd.nix
    ../../common/system/networking.nix
    ../../common/system/nh.nix
    ../../common/system/root.nix
    ../../common/system/timezone.nix
    ../../common/system/user.nix
    ./fs.nix
    ./packages.nix
    ./system.nix
  ];
}
