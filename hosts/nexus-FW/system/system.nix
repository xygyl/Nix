{ stateVersion, pkgs, ... }:

{
  networking.interfaces.eth0.ipv4.addresses = [{
    address = "10.0.0.1";
    prefixLength = 24;
  }];
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  services.gnome.gcr-ssh-agent.enable = false;

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
    ssh.startAgent = true;
    
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
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
