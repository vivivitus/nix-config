{ pkgs, ... }:

{
  # falscher ort, nur zum test
  programs.kdeconnect.enable = true;
  #programs.xwayland.enable = true;

  services = {
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [ pkgs.xterm ];
    };

    gnome = {
      gnome-settings-daemon.enable = true;
      gnome-online-accounts.enable = true;
      gnome-keyring.enable = true;
      evolution-data-server.enable = true;
    };
    
    colord.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      gnome-color-manager
      evolution
    ];

    gnome.excludePackages = (with pkgs; [
      gnome-tour
      yelp
      epiphany
      geary
      cheese
      gnome-calculator
      gvfs
      gnome-characters
      gnome-weather
      gnome-clocks
          ]);
    #        ++ (with pkgs; [

    # ]);
  };
}
