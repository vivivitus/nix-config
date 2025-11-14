{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    nixd
    direnv
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}