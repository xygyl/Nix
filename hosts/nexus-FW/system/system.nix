{ stateVersion, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.users.xygyl.extraGroups = [ "docker" ];

  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  services.gnome.gcr-ssh-agent.enable = false;
  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
      ];
    };
    ssh.startAgent = true;
    
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
      pinentryPackage = pkgs.pinentry-curses;

      # settings = {
      #   allow-loopback-pinentry = true;
      #   ssh-allow-add = true;
      # };
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
    openssh = {
      enable = true;
    };

    fwupd = {
      enable = true;
    };
  };
}
