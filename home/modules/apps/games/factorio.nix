{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # factorio
    # factorio-space-age
  ];
  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
        username = "xygyl";
        token = "0a4cc004eef762a20039625db83bf1";
    };
  };
}
