{
  description = "xygyl's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs = inputs@{ nixpkgs, home-manager, niri, ... }:
  let
    system = "x86_64-linux";
    username = "xygyl";
    homeStateVersion = "26.05";

    hosts = [
      { hostname = "nexus-FW"; stateVersion = "26.05"; }
      { hostname = "nexus"; stateVersion = "26.05"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs hostname username stateVersion;
      };
      modules = [
        niri.nixosModules.niri
        ./hosts/${hostname}
      ];
    };

    makeHome = { hostname }: home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = {
        inherit inputs username homeStateVersion hostname;
      };
      modules = [
        niri.homeModules.niri
        ./home/${hostname}
      ];
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = makeSystem {
        inherit (host) hostname stateVersion;
      };
    }) hosts);
    
    homeConfigurations = builtins.listToAttrs (map (host: {
      name = "${username}@${host.hostname}";
      value = makeHome {
        inherit (host) hostname;
      };
    }) hosts);
  };
}
