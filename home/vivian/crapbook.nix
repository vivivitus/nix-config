{
  imports = [
    ./global
    ./features/gui
    ./features/work
  ];

  home.stateVersion = "24.05";

  programs.ssh.settings."github.com".IdentityFile = "/home/vivian/.ssh/vivian@crapbook";
}