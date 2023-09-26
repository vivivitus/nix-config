let
  wired = "enp9s0";
  wireless = "wlp8s0";
  bridge = "br0";
in {

  networking = {
    hostName = "vividesk";
    useDHCP = false;
    interfaces.br0.useDHCP = true;
    interfaces.admin.useDHCP = true;
    interfaces.server.useDHCP = true;

    dhcpcd.extraConfig =
      ''
      interface = ${bridge};
      metric = 100;

      interface = ${wireless};
      metric = 200;
      '';

    bridges = {
      ${bridge} = {
        interfaces = [ "${wired}" ];
      };
    };
    vlans = {
      admin = {
        id = 1;
        interface = "${wired}";
      };
    };
  };

  # Opens firewall ports UDP 1714 to 1764
  programs.kdeconnect.enable = true;
}