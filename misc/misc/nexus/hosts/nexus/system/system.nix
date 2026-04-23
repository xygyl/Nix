{ stateVersion, pkgs, ... }:

{
  # networking.interfaces.enp6s0.ipv4.addresses = [{
  #   address = "10.0.0.1";
  #   prefixLength = 24;
  # }];
  
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;

  services.hardware.openrgb.enable = true;

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };

    niri.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
  
  services = {
    openssh.enable = true;
    fwupd.enable = true;
  };
}
