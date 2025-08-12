{ pkgs, ... }:

{
  home.packages = with pkgs; [
    super-slicer-latest
    LycheeSlicer
    xorg.libxshmfence
  ];
}