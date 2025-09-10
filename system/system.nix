{ stateVersion, pkgs, ... }:

{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.stateVersion = stateVersion;

  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  programs.niri.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  services.openssh.enable = true;
  services.fwupd.enable = true;

}


