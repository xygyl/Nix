{
  description = "xygyl's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs = inputs@{ nixpkgs, home-manager, niri, nixos-hardware, ... }:
  let
    username = "xygyl";
    homeStateVersion = "26.05";

    hosts = [
      {
        hostname = "nexus-FW";
        stateVersion = "26.05";
        system = "x86_64-linux";
        extraModules = [];
      }
      {
        hostname = "nexus";
        stateVersion = "26.05";
        system = "x86_64-linux";
        extraModules = [];
      }
      {
        hostname = "nexus-pi";
        stateVersion = "26.05";
        system = "aarch64-linux";
        extraModules = [ nixos-hardware.nixosModules.raspberry-pi-4 ];
      }
    ];

    makeSystem = { hostname, stateVersion, system, extraModules, ... }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs hostname username stateVersion; };
      modules = [
        niri.nixosModules.niri
        ./hosts/${hostname}
      ] ++ extraModules;
    };

    makeHome = { hostname, system, ... }: home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = { inherit inputs username homeStateVersion hostname; };
      modules = [
        niri.homeModules.niri
        ./home/${hostname}
      ];
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = makeSystem host;
    }) hosts);

    homeConfigurations = builtins.listToAttrs (map (host: {
      name = "${username}@${host.hostname}";
      value = makeHome host;
    }) hosts);
  };
}
