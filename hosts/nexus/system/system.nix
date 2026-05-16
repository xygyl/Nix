{ stateVersion, pkgs, ... }:

{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  # security.sudo.wheelNeedsPassword = false;
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
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
  
  security.rtkit.enable = true;

  services = {
    openssh.enable = true;
    fwupd.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
