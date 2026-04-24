{ hostname, config, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = hostname;

    firewall = {
      enable = true;
      interfaces.AVPN = {
        allowedUDPPorts = [ 14484 ];
      };
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
      checkReversePath = "loose";
    };
  };
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
