{ lib, ... }:

{
  hardware = {
    steam-hardware.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];
}