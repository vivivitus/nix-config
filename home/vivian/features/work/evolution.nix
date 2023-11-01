{ pkgs, ... }:

{
  home.packages = with pkgs; [
    evolutionWithPlugins
    thunderbird
    birdtray
  ];
}