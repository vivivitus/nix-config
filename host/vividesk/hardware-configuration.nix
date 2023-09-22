{
  imports =
    [];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "uas" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" "dm-snapshot" ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ea276e27-0448-45b6-8f96-d667f38118ac";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ea276e27-0448-45b6-8f96-d667f38118ac";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/ea276e27-0448-45b6-8f96-d667f38118ac";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8845-92B7";
      fsType = "vfat";
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/ea276e27-0448-45b6-8f96-d667f38118ac";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];
  nixpkgs.hostPlatform.system = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
