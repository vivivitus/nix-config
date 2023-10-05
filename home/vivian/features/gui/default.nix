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
    etcher
    gparted
    telegram-desktop
    spotify
  ];
}