{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./discord.nix
    ./etcher.nix
    ./gnome.nix
    ./gparted.nix
    ./telegram.nix
    ./virt-manager.nix
  ];

  home.packages = with pkgs; [
    easyeffects
  ];
}