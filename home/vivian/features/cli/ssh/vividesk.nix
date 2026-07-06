{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {

      "github.com".IdentityFile = "/home/vivian/.ssh/vivian@vividesk";

      "oskar" = {
        host = "oskar";
        hostname = "oskar.lan";
        user = "vivian";
      };

      "sopinian" = {
        host = "sopinian";
        hostname = "sopinian.lan";
        user = "vivian";
      };

      "nix-init" = {
        host = "nix-init";
        hostname = "nix-init.lan";
        user = "vivian";
      };

      "n1" = {
        host = "n1";
        hostname = "n1.lan";
        user = "vivian";
      };

      "n2" = {
        host = "n2";
        hostname = "n2.lan";
        user = "vivian";
      };

      "n3" = {
        host = "n3";
        hostname = "n3.lan";
        user = "vivian";
      };
    };
  };
}