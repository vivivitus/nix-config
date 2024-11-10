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
    ../common/optional/steam.nix
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
  # services.xserver.deviceSection = ''
  #   Option "VariableRefresh" "true"
  # '';
  
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_testing;
    kernelModules = [ "kvm-amd" ];
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

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
  
  programs = {
    corectrl = {
      enable = true;
      gpuOverclock.ppfeaturemask = "0xffffffff";
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      python3 = prev.python3.override {
        packageOverrides = pfinal: pprev: {
          debugpy = pprev.debugpy.overrideAttrs (oldAttrs: {
            pytestCheckPhase = "true";
          });
        };
      };
      python3Packages = final.python3.pkgs;
    })
  ];
  services.udev.packages = [ pkgs.picoscope.rules ];
  users.groups.pico = {};
  users.users.vivian.extraGroups = [ "pico" ];
}