{
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
}
