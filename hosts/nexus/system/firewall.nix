{
  networking.firewall = {
    enable = true;
    interfaces.AVPN = {
      allowedUDPPorts = [ 14484 ];
    };
  };
}
