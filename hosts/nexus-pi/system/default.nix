{
  imports = [
    ../../common/system/env.nix
    ../../common/system/greetd.nix
    ../../common/system/networking.nix
    ../../common/system/nh.nix
    ../../common/system/timezone.nix
    ../../common/system/user.nix
    ./boot.nix
    ./packages.nix
    ./system.nix
  ];
}
