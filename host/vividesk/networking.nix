{
  networking.hostName = "vividesk";

  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles.profiles = {

    bridge_port_1 = {
      connection = {
        id = "Default Bridge Slave";
        type = "ethernet";
        interface-name = "enp4s0";
        master = "bridge_default";
        slave-type = "bridge";
      };
      ipv4 = { method = "disabled"; };
      ipv6 = { method = "disabled"; };
    };

    bridge_default = {
      connection = {
        id = "Default Bridge";
        interface-name = "bridge_default";
        type = "bridge";
        autoconnect = "true";
      };
      bridge = {
        interface-name = "bridge_default";
        stp = "false"; 
      };
      ipv4 = {
        method = "auto";
        route-metric = "101";
      };
      ipv6 = {
        method = "auto";
        route-metric = "100";
        accept-ra = "2";
        addr-gen-mode = "stable-privacy";
      };
    };
  };
  boot.kernel.sysctl = {
    "net.ipv6.conf.bridge_default.accept_ra" = 2;
    "net.ipv6.conf.enp4s0.accept_ra" = 2;
  };
}