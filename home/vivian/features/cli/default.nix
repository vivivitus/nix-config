{ pkgs, ... }: {
  imports = [
    ./bash.nix
  ];
  home.packages = with pkgs; [
    nil
    ncdu
    tree
    usbutils
    pciutils
  ];
}