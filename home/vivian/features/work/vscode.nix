{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nixd
    direnv
  ];
  
  programs.nix-ld.enable = true;
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      ms-python.python
      ms-vscode-remote.remote-ssh
    ];
  };
}
