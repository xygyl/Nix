{ stateVersion, pkgs, ... }:

{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  # security.sudo.wheelNeedsPassword = false;
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
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
  
  security.rtkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config.niri = {
      default = [ "gnome" "gtk" ];
      "org.freedesktop.impl.portal.Access" = [ "gtk" ];
      "org.freedesktop.impl.portal.AppChooser" = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
    };
  };

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
