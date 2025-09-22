{
  description = "xygyl's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    username = "xygyl";
    homeStateVersion = "25.11";

    hosts = [
      { hostname = "nexus-FW"; stateVersion = "25.11"; }
      { hostname = "nexus"; stateVersion = "25.11"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs hostname username stateVersion;
      };
      modules = [
        ./hosts/${hostname}
      ];
    };

    makeHome = { hostname }: home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = {
        inherit inputs username homeStateVersion hostname;
      };
      modules = [
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
