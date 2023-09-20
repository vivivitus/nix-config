{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "i915.force_probe=a7a0" "i915.enable_guc=2" ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1fadc7e9-a139-4580-b358-729ecf16d071";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/fd20514c-b8b7-48ca-ac37-5f7460c8565f";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/1fadc7e9-a139-4580-b358-729ecf16d071";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/1fadc7e9-a139-4580-b358-729ecf16d071";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/1fadc7e9-a139-4580-b358-729ecf16d071";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3D92-08C9";
      fsType = "vfat";
    };

  swapDevices = [ { device = "/swap/swapfile"; }  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
