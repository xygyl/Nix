{ stateVersion, pkgs, ... }:

{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
    ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };

    niri = {
      enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
  
  services = {
    openssh = {
      enable = true;
    };

    fwupd = {
      enable = true;
    };
  };
}
