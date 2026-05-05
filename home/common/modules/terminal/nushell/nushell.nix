{
  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
  };

  xdg.configFile = builtins.listToAttrs (map (f: {
    name = "nushell/${f}";
    value = { source = ./${f}; };
  }) [
    "config/aliases.nu"
    "config/mounting.nu"
    "config/archives/age.nu"
    "config/archives/arch.nu"
    "config/archives/gpg.nu"
    "config/archives/sign.nu"
    "config/archives/tar.nu"
    "config/archives/xz.nu"
    "config/archives/zip.nu"
    "config/archives/zstd.nu"
    "config/coding/setup.nu"
    "config/coding/vcs.nu"
    "config/files.nu"
    "config/fun.nu"
    "config/misc.nu"
    "config/nix.nu"
    "config/sudo/aliases.nu"
    "config/sudo/vpn.nu"
    "mod.nu"
    "nu/completions-jj.nu"
    "nu/completions-niri.nu"
    "nu/starship/init.nu"
    "nu/zoxide.nu"
  ]);
}
