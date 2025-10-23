{
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
  nixpkgs.overlays = [
    (final: prev: {
      argtable = prev.argtable.overrideAttrs (old: {
        cmakeFlags = (old.cmakeFlags or []) ++ [
          # "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        ];
      });
    })
  ];
}
