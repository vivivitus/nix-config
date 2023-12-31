{ pkgs, ... }:

{
  imports = [
    ./evolution.nix
    ./vscode.nix
    ./wireshark.nix
  ];

  home.packages = with pkgs; [
    freecad
    kicad
    rpi-imager
    nextcloud-client
    pdfarranger
    gnucash
  ];
}