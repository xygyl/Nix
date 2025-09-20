{ username, ...}:
{
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 3";
    };

    flake = "/home/${username}/Nix";
  };
}
