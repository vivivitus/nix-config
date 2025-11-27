{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locales.nix
    ./nix.nix
    ./printing.nix
    ./python.nix
    ./steam-hardware.nix
    ./timezone.nix
    ./sound.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  services.flatpak.enable = true;

  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };

  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}