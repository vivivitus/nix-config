{
  networking.hostName = "vividesk";

  systemd.network.enable = true;
  networking.networkmanager.enable = true;

  systemd.network = {
    netdevs = {
      "20-bridge_default" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "bridge_default";
          #MACAddress = "none";
        };
      };
    };

    networks = {
      "30-enp1s0" = {
        matchConfig.Name = "enp9s0";
        networkConfig.Bridge = "bridge_default";
        linkConfig.RequiredForOnline = "enslaved";
      };

      "40-bridge_default" = {
        matchConfig.Name = "bridge_default";
        bridgeConfig = {};
        networkConfig.LinkLocalAddressing = "no";
        linkConfig = {
          #MACAddressPolicy = "none";
          RequiredForOnline = "carrier";
        };
      };
    };
  };

  networking.networkmanager.ensureProfiles.profiles = {

    # bridge_default = {
    #   connection = {
    #     id = "nm_bridge";
    #     uuid = "4788c380-4053-4334-a137-3cf8486e1636";
    #     #master = "bridge_default";
    #     interface-name = "bridge_default";
    #     type = "bridge";
    #     autoconnect = "true";
    #   };
    #   # bridge = {
    #   #   interface-name = "bridge_default";
    #   # };
    #   ipv4 = {
    #     method = "auto";
    #     route-metric = "101";
    #   };
    #   ipv6 = {
    #     method = "auto";
    #     route-metric = "100";
    #   };
    # };

    user_lan = {
      connection = {
        id = "user_lan";
        interface-name = "user_lan";
        type = "ethernet";
        master = "bridge_default";
        slave-type = "bridge";
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

    vlan_admin = {
      connection = {
        id = "Administration VLAN";
        interface-name = "vlan_admin";
        type = "vlan";
      };
      vlan = {
        interface-name = "vlan_admin";
        parent = "bridge_default";
        id = "1";
      };
      ipv4 = {
        method = "auto";
        route-metric = "201";
      };
      ipv6 = {
        method = "auto";
        route-metric = "200";
      };
    };
  };
}
