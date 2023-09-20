{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "vivivitus";
    userEmail = "vivi_vitus@hotmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}