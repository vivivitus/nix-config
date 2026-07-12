{
  imports = [
    ./global
    ./features/gui
    ./features/work/vscode.nix
  ];

  home.stateVersion = "26.05";

  programs.ssh.settings."github.com".IdentityFile = "/home/vivian/.ssh/vivian@sopinian";
}
