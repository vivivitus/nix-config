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
}