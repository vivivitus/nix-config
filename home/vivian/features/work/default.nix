{ pkgs, ... }:

{
  imports = [
    ./evolution.nix
    ./vscode.nix
    ./wireshark.nix
    ./3d-printing.nix
    ./kicad.nix
  ];

  home.packages = with pkgs; [
    freecad
    rpi-imager
    rpiboot
    nextcloud-client
    pdfarranger
    gnucash
    gmsh
    darktable
    gimp
    inkscape
  ];
}