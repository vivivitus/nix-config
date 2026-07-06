{

  # hide raid volumes in nautilus
  services.udev.extraRules = ''
    ENV{ID_SERIAL}=="ST5000LM000-2U8170_WCJC4KQB", ENV{UDISKS_IGNORE}="1"
    ENV{ID_SERIAL}=="ST5000LM000-2U8170_WCJC3SG9", ENV{UDISKS_IGNORE}="1"
    ENV{ID_SERIAL}=="ST5000LM000-2AN170_WCJ1SKQJ", ENV{UDISKS_IGNORE}="1"
  '';

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
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
    { device = "/dev/disk/by-uuid/9ba30658-dba5-40b6-8126-04220245fe91";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7D01-47E4";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/9ba30658-dba5-40b6-8126-04220245fe91";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/9ba30658-dba5-40b6-8126-04220245fe91";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/9ba30658-dba5-40b6-8126-04220245fe91";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 32*1024;
  }];

  fileSystems."/home/vivian/Archive" =
    { device = "/dev/sdb";
      fsType = "btrfs";
      options = [ "noatime" ];
    };
}
