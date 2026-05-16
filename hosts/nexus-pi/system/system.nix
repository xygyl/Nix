{ stateVersion, pkgs, ... }:

{
  boot = {
    kernelParams = [
      "console=tty1"
      "cma=256M"
    ];
    initrd.kernelModules = ["vc4" "bcm2835_dma" "i2c_bcm2835"];
    loader.generic-extlinux-compatible.configurationLimit = 10;
  };

  hardware.enableRedistributableFirmware = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "root" "xygyl" ];
  };

  swapDevices = [{ device = "/swapfile"; size = 4096; }];

  system.stateVersion = stateVersion;
  nixpkgs.config.allowUnfree = true;
  # security.sudo.wheelNeedsPassword = false;
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };
  services.gnome.gcr-ssh-agent.enable = false;
  programs.niri.enable = true;

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
    };
  };

  services = {
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
