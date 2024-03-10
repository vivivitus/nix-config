{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    #./networking.nix
    ./networkmanager.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/pipewire.nix
    ../common/optional/gnome.nix
    ../common/optional/plymouth.nix
    ../common/virtualisation/libvirt.nix
    ../common/virtualisation/bottles.nix
  ];

  system.stateVersion = "24.05";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  # For 32 bit applications 
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true; # This is already enabled by default
  hardware.opengl.driSupport32Bit = true; # For 32 bit applications

}