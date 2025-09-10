{
  description = "xygyl flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    username = "xygyl";
    homeStateVersion = "25.05";

    # --------- Host Declarations --------- #
    hosts = [
      { hostname = "nexus-FW"; stateVersion = "25.05"; }
      { hostname = "nexus"; stateVersion = "25.05"; }
    ];

    # ---------- System Function ---------- #
    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs hostname username stateVersion;
      };
      modules = [
        ./hosts/${hostname}
      ];
    };

    # ---------- Home Function ---------- #
    makeHome = { hostname }: home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = {
        inherit inputs username homeStateVersion hostname;
      };
      modules = [
        ./home
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
