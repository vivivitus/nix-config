{

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  boot.swraid = {
    enable = true;
    mdadmConf = ''
      DEVICE partitions
      MAILADDR vivian@vivi.land
      ARRAY /dev/md/data metadata=1.2 name=vividesk:data UUID=c7ca0418:4c1ba1e5:70133e1c:3fe6a572
    '';
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/6b29879b-436e-4dba-8a60-1531aec89584";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6b29879b-436e-4dba-8a60-1531aec89584";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/6b29879b-436e-4dba-8a60-1531aec89584";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/82F9-0797";
      fsType = "vfat";
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/6b29879b-436e-4dba-8a60-1531aec89584";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  fileSystems."/home/vivian/Archive" =
    { device = "/dev/disk/by-uuid/6c40eb20-2aaf-4b76-b544-319d99b84791";
      fsType = "ext4";
      options = [ "noatime" ];
    };
}
