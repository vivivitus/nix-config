{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locales.nix
    ./nix.nix
    ./timezone.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

<<<<<<< HEAD
  services.flatpak.enable = true;

  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };

=======
>>>>>>> 9f81f2e6aa1cfdd46fa9adc194ace59db87ea5a1
  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}