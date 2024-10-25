{ config, ... }:

{
  boot.kernelParams = [
  "mem_sleep_default=deep"
  "resume=UUID=1fadc7e9-a139-4580-b358-729ecf16d071" # findmnt -o UUID --noheadings /swap/
  "resume_offset=533760" # btrfs inspect-internal map-swapfile -r /swap/swapfile
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/1fadc7e9-a139-4580-b358-729ecf16d071";

  systemd.sleep.extraConfig = ''
    MemorySleepMode=deep
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=yes
    HibernateDelaySec=30
  '';
}