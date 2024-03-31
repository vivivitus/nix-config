{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = true;
  users.users.vivian = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "lp"
      "scanner"
    ] ++ ifTheyExist [
      "deluge"
      "wireshark"
      "libvirtd"
      # geht nicht hoi
    ];

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.vivian = import ../../../../home/vivian/${config.networking.hostName}.nix;
}