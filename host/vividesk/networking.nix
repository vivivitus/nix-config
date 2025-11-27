{
  networking.hostName = "vividesk";

  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles.profiles = {

    bridge_port_1 = {
      connection = {
        id = "Default Bridge Slave";
        type = "ethernet";
        interface-name = "enp2s0f0u3c2";
        master = "bridge_default";
        slave-type = "bridge";
      };
    };

    bridge_default = {
      connection = {
        id = "Default Bridge";
        interface-name = "bridge_default";
        type = "bridge";
        autoconnect = "false";
      };
      bridge = {
        interface-name = "bridge_default";
      };
      ipv4 = {
        method = "auto";
        route-metric = "101";
      };
      ipv6 = {
        method = "auto";
        route-metric = "100";
      };
    };

    # vlan_admin = {
    #   connection = {
    #     id = "Administration VLAN";
    #     interface-name = "vlan_admin";
    #     type = "vlan";
    #   };
    #   vlan = {
    #     interface-name = "vlan_admin";
    #     parent = "bridge_default";
    #     id = "1";
    #   };
    #   ipv4 = {
    #     method = "auto";
    #     route-metric = "201";
    #   };
    #   ipv6 = {
    #     method = "auto";
    #     route-metric = "200";
    #   };
    # };
  };
}
