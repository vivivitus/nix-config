{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./storage.nix
    ./networking.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/python.nix
    ../common/optional/steam-hardware.nix
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/gnome.nix
    #../common/optional/plymouth.nix
    ../common/optional/steam.nix
    #../common/optional/docker.nix
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

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  boot = {
    #kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    kernelParams = [ 
      "acpi_enforce_resources=lax"
    ];

    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "uas" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" "dm-snapshot" ];
    };

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu.overdrive.ppfeaturemask = "0xffffffff";
  };
  
  programs = {
    corectrl = {
      enable = true;
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
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="2207", MODE="0666",GROUP="plugdev"
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", MODE="0666",GROUP="plugdev"
  '';
  nixpkgs.config.allowBroken = true;
}