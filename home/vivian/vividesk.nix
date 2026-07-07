{
  imports = [
    ./global
    ./features/gui
    ./features/work
    ./features/virtualisation/virt-manager.nix
    ./features/cli/ssh/rothstrasse.nix
  ];

  home.stateVersion = "24.05";
}