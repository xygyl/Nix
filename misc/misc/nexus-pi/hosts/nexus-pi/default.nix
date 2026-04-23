{ inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ./system
    ./hardware-configuration.nix
  ];
}
