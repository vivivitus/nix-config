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
    gnumake
    rkdeveloptool
    libusb1
    fido2-manage
  ];
}