{ lib, ... }:

{
  services.resolved = {
    enable = true;
    dnssec = "false";
    extraConfig = "DNSOverTLS=no";
  };

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "vivibook";
  };

  # Opens firewall ports UDP 1714 to 1764
  programs.kdeconnect.enable = true;
}