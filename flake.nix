{
  description = "NixOS configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    sops-nix.url = "github:mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      architectures = [ "x86_64-linux" "aarch64-linux" ];
      perArchitecture = f: lib.genAttrs architectures (arch: f packageArchitecture.${arch});
      packageArchitecture = nixpkgs.legacyPackages;
    in
    {
    inherit lib;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    
    #packages = perArchitecture (pkgs: import ./pkgs { inherit pkgs; });
    devShells = perArchitecture (pkgs: import ./shell.nix { inherit pkgs; });
    #formatter = perArchitecture (pkgs: pkgs.nixpkgs-fmt);

    nixosConfigurations = {
      vividesk = lib.nixosSystem {
        modules = [ ./host/vividesk ];
        specialArgs = { inherit inputs outputs; }; # wenn das fehlt infinit loop?
      };

      vivibook = lib.nixosSystem {
        modules = [ ./host/vivibook ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "vivian@vividesk" = lib.homeManagerConfiguration {
        modules = [ ./home/vivian/vividesk.nix ];
        pkgs = packageArchitecture.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "vivian@vivibook" = lib.homeManagerConfiguration {
        modules = [ ./home/vivian/vivibook.nix ];
        pkgs = packageArchitecture.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}
