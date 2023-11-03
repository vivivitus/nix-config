{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ladspaPlugins
    # (callPackage ./libdeepfilter.nix {})
  ];
}