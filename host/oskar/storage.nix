{ ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1e593f43-20e1-435e-be33-1fdfaf696e9a";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/1e593f43-20e1-435e-be33-1fdfaf696e9a";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/1e593f43-20e1-435e-be33-1fdfaf696e9a";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/DE19-2968";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/1e593f43-20e1-435e-be33-1fdfaf696e9a";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];
}
