{ pkgs, ... }:

{
  imports = [
    ./evolution.nix
    ./vscode.nix
    ./3d-printing.nix
    ./kicad.nix
  ];

  home.packages = with pkgs; [
    rpi-imager
    #rpiboot
    nextcloud-client
    pdfarranger
    #gnucash
    gmsh
    darktable
    gimp
    inkscape
    mono
    picoscope
    picocom
    freecad
    libredwg
    notepadqq
  ];
}