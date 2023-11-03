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
    swraid = {
      enable = true;
      mdadmConf = ''
        DEVICE partitions
        MAILADDR vivian@vivi.land
        ARRAY /dev/md/data metadata=1.2 name=vividesk:data UUID=c7ca0418:4c1ba1e5:70133e1c:3fe6a572
      '';
    };
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;
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

  fileSystems."/home/vivian/Archive" =
    { device = "/dev/disk/by-uuid/6c40eb20-2aaf-4b76-b544-319d99b84791";
      fsType = "ext4";
      options = [ "noatime" ];
    };

  nixpkgs.hostPlatform.system = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
