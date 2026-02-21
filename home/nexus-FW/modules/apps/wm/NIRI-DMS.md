# Niri + DankMaterialShell Integration

## Problem

DMS's niri module uses an "includes hack" to split the niri config into multiple files:

```
~/.config/niri/
  config.kdl       -> symlink, contains include statements
  hm.kdl           -> symlink, niri-flake generated config
  dms/
    alttab.kdl     -> DMS auto-generated (recent-windows defaults)
    binds.kdl      -> DMS auto-generated (empty)
    colors.kdl     -> DMS auto-generated (theme colors from matugen)
    layout.kdl     -> DMS auto-generated (gaps, border, corner-radius)
    outputs.kdl    -> DMS auto-generated (empty)
    wpblur.kdl     -> DMS auto-generated (wallpaper blur layer-rule)
```

`config.kdl` includes all these files. The include order determines priority
(last file wins). With `override = true` (DMS default), `hm.kdl` loads first
and DMS files load after, so DMS defaults override user settings.

The `dms/*.kdl` files are auto-generated at runtime by the `dms` process and
marked "DO NOT EDIT". They cannot be managed via `xdg.configFile` because DMS
overwrites them on startup.

## Solution

### 1. `home.nix` - Include order

Set `override = false` so `hm.kdl` loads **last**, giving user settings
priority over DMS defaults:

```nix
programs.dank-material-shell.niri.includes = {
  enable = true;
  override = false;
  originalFileName = "hm";
  filesToInclude = [ "alttab" "binds" "colors" "layout" "outputs" "wpblur" ];
};
```

This changes the generated `config.kdl` from:

```kdl
include "hm.kdl"            // user config (loaded first, lowest priority)
include "dms/alttab.kdl"    // DMS overrides user
...
```

To:

```kdl
include "dms/alttab.kdl"    // DMS defaults (loaded first)
...
include "hm.kdl"            // user config (loaded last, highest priority)
```

### 2. `niri.nix` - Bypass build-time validation

niri-flake validates the config at build time using `niri validate` via the
`validated-config-for` function in its flake.nix (line 231). The validator
uses the niri binary bundled with niri-flake, which may lag behind the system
niri version. In this case, `recent-windows` (a newer niri feature) is not
recognized by the validator, causing the build to fail.

Using `programs.niri.config` triggers this validation. Instead, the xdg config
file source is overridden directly with `mkForce`, bypassing the validation
derivation:

```nix
{ pkgs, lib, ... }: {
  xdg.configFile."niri-config".source = lib.mkForce
    (pkgs.writeText "niri-hm-config.kdl"
      (''
        spawn-at-startup "dms" "run"
      '' + builtins.readFile ../../../../../config.kdl));
}
```

The DMS module renames `niri-config`'s target from `niri/config.kdl` to
`niri/hm.kdl` via `lib.mkForce` on the target (niri.nix line 91). This
rename still applies - only the source/content is overridden.

`spawn-at-startup "dms" "run"` is prepended because `enableSpawn = true`
normally adds it via `programs.niri.settings`, but since the xdg source is
overridden, the settings-rendered config is no longer used for this file.

### 3. `config.kdl` (repo root) - Source of truth

The raw KDL config at the repo root is read by `builtins.readFile` and used
as the content of `hm.kdl`. This file must be git-tracked (`git add config.kdl`)
because Nix flakes only include tracked files in the source tree.

Edit this file to change niri settings. After editing, run:

```sh
git add config.kdl
home-manager switch --flake .#xygyl@nexus-FW
```

If `home-manager switch` exits 0 but doesn't activate (check with
`home-manager generations`), manually activate:

```sh
/nix/store/<latest-gen-hash>-home-manager-generation/activate
```

## How DMS include priority works

With `override = false`, the load order is:

```
1. dms/alttab.kdl   - DMS recent-windows defaults (corner-radius 12)
2. dms/binds.kdl     - empty
3. dms/colors.kdl    - DMS theme colors (dynamic theming via matugen)
4. dms/layout.kdl    - DMS layout defaults (gaps 4, border width 2, corner-radius 12)
5. dms/outputs.kdl   - empty
6. dms/wpblur.kdl    - DMS wallpaper blur layer-rule (dms:blurwallpaper namespace)
7. hm.kdl            - user config (overrides all above where settings conflict)
```

In niri, later includes override earlier ones for the same setting. Non-conflicting
settings from DMS files still apply (e.g., DMS's `geometry-corner-radius` window-rule
coexists with user window-rules).

## Relevant source locations

- DMS niri module: `/nix/store/i32r9gicbwkysn2ly55g4sv8wghv3wmc-source/distro/nix/niri.nix`
- niri-flake validation: `/nix/store/mzg5mi2prgjkbvqgj6lphbf4xvnssnag-source/flake.nix` (line 231, `validated-config-for`)
- niri-flake config option: `/nix/store/mzg5mi2prgjkbvqgj6lphbf4xvnssnag-source/settings.nix` (line 3030)
- niri-flake xdg file: `/nix/store/mzg5mi2prgjkbvqgj6lphbf4xvnssnag-source/flake.nix` (line 441)
- DMS documentation: https://danklinux.com/docs/dankmaterialshell/nixos-flake
