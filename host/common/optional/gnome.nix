{ pkgs, ... }:

{
  # falscher ort, nur zum test
  programs.kdeconnect.enable = true;
  #programs.xwayland.enable = true;

  services = {
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [ pkgs.xterm ];
    };

    gnome = {
      gnome-settings-daemon.enable = true;
      gnome-online-accounts.enable = true;
      gnome-keyring.enable = true;
    };
    
    colord.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      gnome.gnome-color-manager
      evolution
    ];

    gnome.excludePackages = (with pkgs; [
      gnome-tour
          ]) ++ (with pkgs.gnome; [
      yelp
      epiphany
      geary
      cheese
      gvfs
      gnome-calculator
      gnome-characters
      gnome-weather
      gnome-clocks
    ]);
  };
}
