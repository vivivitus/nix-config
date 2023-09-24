{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./networking.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/pipewire.nix
    ../common/optional/gnome.nix
    ../common/optional/plymouth.nix
    ../common/optional/libvirt.nix
    ../common/optional/waydroid.nix
  ];

  system.stateVersion = "23.11";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };
}