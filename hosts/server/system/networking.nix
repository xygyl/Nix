{ hostname, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
  };
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
