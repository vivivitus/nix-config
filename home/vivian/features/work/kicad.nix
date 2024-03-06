{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kicad
    kicadAddons.kikit-library
    kikit
  ];
}