{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
   # inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./storage.nix
    ./networking.nix
    ./hibernate.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/gnome.nix
    ../common/optional/plymouth.nix

  ];


  nixpkgs.hostPlatform.system = "x86_64-linux";
  system.stateVersion = "24.05";

  hardware.cpu.intel.updateMicrocode = true;
  powerManagement.cpuFreqGovernor = "powersave";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelModules = [ "kvm-intel" ];
    kernelParams = [  ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "i915" "nvme" "xhci_pci" "ahci" "uas" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      luks.devices."root".device = "/dev/disk/by-uuid/fd20514c-b8b7-48ca-ac37-5f7460c8565f";
    };

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };
  };

  # services.undervolt = {
  #   enable = true;
  #   verbose = true;
  #   uncoreOffset = -40;
  #   coreOffset = -40;
  #   gpuOffset= -40;
  #   analogioOffset = -40;
  # };

  # hardware.usb-modeswitch.enable = true;
}
