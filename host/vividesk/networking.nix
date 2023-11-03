{
  networking.hostName = "vividesk";
  
  # Opens firewall ports UDP 1714 to 1764
  programs.kdeconnect.enable = true;

  # Disable networkmanager management of wired interfaces
  networking = {
    networkmanager.unmanaged = [
      "br0"
      "admin"
      "enp9s0"
    ];
  };

  systemd.network.enable = true;
  systemd.network = {
    netdevs = {
      "10-bridge-default" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br0";
        };
      };
      "10-vlan-admin" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "admin";
        };
        vlanConfig.Id = 1;
      };
    };

    networks = {
      "20-bridge-default-bind" = {
        matchConfig.Name = "enp9s0";
        networkConfig.Bridge = "br0";
        linkConfig.RequiredForOnline = "enslaved";
        vlan = [ "admin" ];
      };
      "30-wired" = {
        matchConfig.Name = "br0";
        dhcpV4Config = { RouteMetric = 100; };
        dhcpV6Config = { RouteMetric = 100; };
        networkConfig.DHCP = "ipv4";
        networkConfig.IPv6AcceptRA = true;
        networkConfig.IPv6PrivacyExtensions = true;
      };
      "40-vlan-admin" = {
        matchConfig.Name = "admin";
        dhcpV4Config = { RouteMetric = 200; };
        dhcpV6Config = { RouteMetric = 200; };
        networkConfig.DHCP = "ipv4";
        networkConfig.IPv6AcceptRA = true;
        networkConfig.IPv6PrivacyExtensions = true;
      };
    };
  };
}