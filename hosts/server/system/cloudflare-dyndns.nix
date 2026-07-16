{
  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = "/etc/cloudflare-dyndns/api-token";
    domains = [ "mc.jakairan.xyz" ];
    proxied = false;
  };
}
