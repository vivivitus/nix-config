{ pkgs, ... }:

let
  vscodeFixed = pkgs.vscode.override {
    buildVscode =
      args:
      (pkgs.buildVscode args).overrideAttrs (old: {
        postPatch =
          pkgs.lib.replaceStrings
            [
              "resources/app/node_modules/@vscode/ripgrep/bin/rg"
            ]
            [
              "resources/app/node_modules.asar.unpacked/@vscode/ripgrep-universal/bin/linux-x64/rg"
            ]
            old.postPatch;
      });
  };
in
{
  home.packages = with pkgs; [
    nixfmt
    statix
    deadnix
    nixd
  ];

  programs.vscode = {
    enable = true;
    package = vscodeFixed;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      ms-python.python
      ms-vscode-remote.remote-ssh
    ];
  };
}

# { pkgs, ... }:

# {
#   home.packages = with pkgs; [
#     nixfmt
#     statix
#     deadnix
#     nixd
#   ];

#   programs.vscode = {
#     enable = true;
#     profiles.default.extensions = with pkgs.vscode-extensions; [
#       jnoortheen.nix-ide
#       ms-python.python
#       ms-vscode-remote.remote-ssh
#     ];
#   };
# }
