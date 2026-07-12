{
  imports = [
    ./global
    ./features/gui
    ./features/work
    ./features/virtualisation/virt-manager.nix
    ./features/cli/ssh/rothstrasse.nix
  ];

  home.stateVersion = "24.05";

  programs.ssh.settings."github.com".IdentityFile = "/home/vivian/.ssh/vivian@vividesk";
}