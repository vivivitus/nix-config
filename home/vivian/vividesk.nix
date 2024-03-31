{
  imports = [
    ./global
    ./features/gui
    ./features/work
    ./features/gaming
  ];

  # Versuch "gkr-pam: unable to locate daemon control file" zu beheben
  home.sessionVariables = {
    XDG_RUNTIME_DIR = "/run/user/$UID";
  };

}