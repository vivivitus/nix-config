{ pkgs, lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.forge
    gnomeExtensions.caffeine
    gnomeExtensions.gsconnect
  ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "ch" ]) ];
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/Console" = {
      theme = "auto";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "forge@jmmaranan.com"
        "caffeine@patapon.info"
        "gsconnect@andyholmes.github.io"
        ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "small";
    };
  };
}