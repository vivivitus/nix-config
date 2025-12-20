{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name  = "vivivitus";
      user.email = "vivi_vitus@hotmail.com";
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}