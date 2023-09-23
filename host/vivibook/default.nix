{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./networking.nix
    ../common/global
    ../common/user/vivian
    ../common/optional/pipewire.nix
    ../common/optional/gnome.nix
    ../common/optional/plymouth.nix
  ];

  system.stateVersion = "23.11";

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

  services = {
    
    xserver = {

      libinput = {
        enable = true;
        mouse.accelProfile = "flat";
        touchpad = {
          clickMethod = "clickfinger";
          accelSpeed = "-0.15";
        };
      };
    };
  };

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "2";
  };
}
