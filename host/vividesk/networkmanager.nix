
{
  networking.hostName = "vividesk";

  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles.profiles = {

    bridge_default = {
      connection = {
        id = "Default Bridge";
        uuid = "e291db52-cd82-3bf3-9fed-79563b909738";
        interface-name = "bridge_default";
        type = "bridge";
        autoconnect = "false";
      };
      bridge = {
        interface-name = "bridge_default";
      };
    };

    bridge_port_1 = {
      connection = {
        id = "Default Bridge Slave";
        type = "ethernet";
        master = "bridge_default";
        slave-type = "bridge";
      };
    };
    vlan_admin = {
      connection = {
        id = "Administration VLAN";
        uuid = "fe6b48da-c2b2-3a2f-a4dc-e6fe0c7b504e";
        interface-name = "vlan_admin";
        type = "vlan";
      };
      vlan = {
        interface-name = "vlan_admin";
        parent = "bridge_default";
        id = "4";
      };
    };
  };
}
