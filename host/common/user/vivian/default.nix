{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = true;
  users.users.vivian = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "wireshark"
      "libvirtd"
    ] ++ ifTheyExist [
      "deluge"
      # geht nicht hoi
    ];

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.vivian = import ../../../../home/vivian/${config.networking.hostName}.nix;
}