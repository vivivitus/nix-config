{ pkgs, ... }:

let
  python-pkgs = ps: with ps; [
    gmsh
    numpy
    matplotlib
    scipy
    pyqt5
    pyside2
  ];
in {
  environment.systemPackages = [
    (pkgs.python3.withPackages python-pkgs)
  ];
}