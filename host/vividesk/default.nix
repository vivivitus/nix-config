{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./storage.nix
    ./networking.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/pipewire.nix
    ../common/optional/gnome.nix
    ../common/optional/plymouth.nix
    ../common/virtualisation/libvirt.nix
    ../common/virtualisation/bottles.nix
  ];

  nixpkgs.hostPlatform.system = "x86_64-linux";
  system.stateVersion = "24.05";

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  services.ratbagd.enable = true;

  # does not work
  services.xserver.deviceSection = ''
    Option "VariableRefresh" "true"
  '';
  
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelModules = [ "kvm-amd" "btusb" "btintel" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "uas" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" "dm-snapshot" ];
    };

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
  
  programs = {
    corectrl = {
      enable = true;
      gpuOverclock.ppfeaturemask = "0xffffffff";
    };
  };
}