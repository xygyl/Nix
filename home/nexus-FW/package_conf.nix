{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
    "olm-3.2.16"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      argtable = prev.argtable.overrideAttrs (old: {
        cmakeFlags = (old.cmakeFlags or []) ++ [
          "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        ];
      });

      # pioneer = prev.pioneer.overrideAttrs (old: {
      #   cmakeFlags = (old.cmakeFlags or []) ++ [
      #     "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
      #   ];
      # });
    })
  ];
}
