{ config, ... }:

{
  boot.kernelParams = [
  "resume=UUID=a2aa52a9-13ef-45a3-8711-8e0755772aa9" # findmnt -o UUID --noheadings /swap/
  "resume_offset=533760" # btrfs inspect-internal map-swapfile -r /swap/swapfile
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/a2aa52a9-13ef-45a3-8711-8e0755772aa9";

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=yes
    HibernateDelaySec=1800
  '';
}