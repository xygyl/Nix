{
  description = "xygyl flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations = {
      nexus-FW = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nexus-FW/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      xygyl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/xygyl_nexus-FW/home.nix ];
      };
    };
  };
}
