{ username, ... }:

{
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 2 --optimise";
    };

    flake = "/home/${username}/Nix";
  };
}
