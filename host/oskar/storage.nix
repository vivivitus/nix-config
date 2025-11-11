{ ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/29ce79e8-e901-4ff9-9dff-5a714f9a1641";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/29ce79e8-e901-4ff9-9dff-5a714f9a1641";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/29ce79e8-e901-4ff9-9dff-5a714f9a1641";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A2A9-D620";
      fsType = "btrfs";
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/29ce79e8-e901-4ff9-9dff-5a714f9a1641";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];
}
