{
  description = "xygyl's flake";

  inputs = {
    awww.url = "git+https://codeberg.org/LGFae/awww";
    concord.url = "github:chojs23/concord";
    rio.url = "github:raphamorim/rio";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ nixpkgs, home-manager, niri, nixos-hardware, ... }:
  let
    homeStateVersion = "26.05";

    hosts = [
      {
        hostname = "europa";
        username = "europa";
        stateVersion = "26.05";
        system = "x86_64-linux";
        extraModules = [];
      }
      {
        hostname = "nexus-FW";
        username = "xygyl";
        stateVersion = "26.05";
        system = "x86_64-linux";
        extraModules = [];
      }
      {
        hostname = "nexus";
        username = "xygyl";
        stateVersion = "26.05";
        system = "x86_64-linux";
        extraModules = [];
      }
      {
        hostname = "nexus-pi";
        username = "xygyl";
        stateVersion = "26.05";
        system = "aarch64-linux";
        extraModules = [ nixos-hardware.nixosModules.raspberry-pi-4 ];
      }
    ];

    makeSystem = { hostname, stateVersion, system, extraModules, username, ... }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs hostname username stateVersion; };
        modules = [
          niri.nixosModules.niri
          ./hosts/${hostname}
        ] ++ extraModules;
      };

    makeHome = { hostname, system, username, ... }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        extraSpecialArgs = { inherit inputs username homeStateVersion hostname; };
        modules = [
          inputs.niri.homeModules.niri
          inputs.dms.homeModules.dank-material-shell
          inputs.dms.homeModules.niri
          ./home/${hostname}
        ];
      };
  in {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = makeSystem host;
    }) hosts);

    homeConfigurations = builtins.listToAttrs (map (host: {
      name = "${host.username}@${host.hostname}";
      value = makeHome host;
    }) hosts);
  };
}
