{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.geoclue2 ];
  services.localtimed.enable = true;
  services.automatic-timezoned.enable = true;
}