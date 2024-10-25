{ pkgs, ... }: {
  imports = [
    ./bash.nix
  ];
  home.packages = with pkgs; [
    nil
    ncdu
    tree
    usbutils
    libusb1
    pciutils
    pmbootstrap
    appimage-run
    flatpak
    gnome.gnome-software
  ];
}