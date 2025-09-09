# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nexus-FW";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fileSystems."/home/xygyl/Ram" = {
    device = "tmpfs";
    fsType  = "tmpfs";
    options = [ "size=60G" "mode=0775" "nosuid" "nodev" "noatime" ];
  };
  systemd.tmpfiles.rules = [
    # "d <path> <mode> <user> <group> <age>"
    "d /home/xygyl/Ram 0775 xygyl users -"
  ];
  
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "";
    flake = "~/Nix";
  };

  users.users.xygyl = {
    isNormalUser = true;
    description = "xygyl";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    # packages = with pkgs; [];
    shell = pkgs.nushell;
  };

  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowUnfree = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    fontconfig.enable = true;
  };

  programs.niri.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };


  services.xserver.videoDrivers = [ "amdgpu" ];
  
  services.greetd = {
    enable = true;
    restart = false;

    settings = rec {
      initial_session = {
        # command = "sh -c 'sleep 2 && exec dbus-run-session niri'";
        command = "dbus-run-session niri";
        user = "xygyl";
      };

      default_session = initial_session;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  services.openssh.enable = true;
  services.fwupd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 14484 ];
  networking.firewall = {
    enable = true;
    interfaces.AVPN = {
      allowedUDPPorts = [ 14484 ];
    };
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.autoUpgrade.enable = true;
  environment.systemPackages = with pkgs; [
    monero-cli
    p2pool
    wireguard-tools
    xmrig
    zellij
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
