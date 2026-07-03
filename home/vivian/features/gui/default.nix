{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./gnome.nix
    ./virtmanager.nix
  ];

  home.packages = with pkgs; [
    discord
    easyeffects
    gparted
    telegram-desktop
    spotify
    libreoffice
    vlc
    synergy
    #exodus #can not be automatically installed
  ];
}