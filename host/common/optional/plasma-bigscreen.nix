{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm.enable = true;

  environment.systemPackages = with pkgs.kdePackages; [
    plasma-bigscreen
  ];

  services.displayManager.sessionPackages = [
    pkgs.kdePackages.plasma-bigscreen
  ];

  xdg.portal.configPackages = [
    pkgs.kdePackages.plasma-bigscreen
  ];
}
