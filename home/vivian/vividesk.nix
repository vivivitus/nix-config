{ pkgs, ... }:

{
  imports = [
    ./global
    ./features/gui
    ./features/work
  ];

  # Versuch "gkr-pam: unable to locate daemon control file" zu beheben
  home.sessionVariables = {
    XDG_RUNTIME_DIR = "/run/user/$UID";
  };

  home.packages = with pkgs; [
    piper
  ];

}