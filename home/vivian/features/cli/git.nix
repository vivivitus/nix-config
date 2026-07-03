{ config, osConfig, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "vivivitus";
        email = "vivi_vitus@hotmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/%u@\${HOSTNAME}";
        IdentitiesOnly = "yes";
      };
    };
  };
}