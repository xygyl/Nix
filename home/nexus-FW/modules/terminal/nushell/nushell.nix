{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
  };

  xdg.configFile = builtins.listToAttrs (map (f: {
    name = "nushell/${f}";
    value = { source = ./${f}; };
  }) [
    "mod.nu"
    "config/aliases.nu"
    "config/files.nu"
    "config/fun.nu"
    "config/misc.nu"
    "config/nix.nu"
    "config/coding/setup.nu"
    "config/coding/vcs.nu"
    "config/sudo/aliases.nu"
    "config/sudo/vpn.nu"
    "config/archives/arch.nu"
    "config/archives/gpg.nu"
    "config/archives/tar.nu"
    "config/archives/xz.nu"
    "config/archives/zip.nu"
    "config/archives/zstd.nu"
    "nu/completions-jj.nu"
    "nu/starship/init.nu"
    "nu/zoxide.nu"
  ]);
}
