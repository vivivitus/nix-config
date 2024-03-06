{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (kicad.addons kikit kikit-library)
  ];
}