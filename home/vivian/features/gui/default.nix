{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./gnome.nix
  ];

  home.packages = with pkgs; [
    discord
    easyeffects
    gparted
    telegram-desktop
    spotify
    vlc
    #exodus #can not be automatically installed
  ];
}