{
  networking = {
    hostName = "vividesk";
    useDHCP = false;
    interfaces.br0.useDHCP = true;
    bridges = {
      "br0" = {
        interfaces = [ "enp9s0" ];
      };
    };
  };

  # Opens firewall ports UDP 1714 to 1764
  programs.kdeconnect.enable = true;
}