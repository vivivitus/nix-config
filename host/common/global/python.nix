{ pkgs, ... }:

{
    environment.systemPackages = [
      pkgs.python3
      pkgs.python311Packages.gmsh
  ];
}