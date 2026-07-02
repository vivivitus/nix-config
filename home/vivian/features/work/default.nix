{ pkgs, ... }:

{
  imports = [
    ./evolution.nix
    ./vscode.nix
    ./3d-printing.nix
    ./kicad.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    #rpi-imager
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
    libredwg
    # gnucash
    stm32cubemx
    stlink-tool
    stlink-gui
  ];
}