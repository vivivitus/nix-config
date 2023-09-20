{ pkgs, ... }:

{
  home.packages = with pkgs; [
    evolutionWithPlugins
  ];
}