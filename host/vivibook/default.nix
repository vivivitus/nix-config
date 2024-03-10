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
    loader.systemd-boot.configurationLimit = 3;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "iomem=relaxed" ];
  };

  # services.undervolt = {
  #   enable = true;
  #   verbose = true;
  #   uncoreOffset = -40;
  #   coreOffset = -40;
  #   gpuOffset= -40;
  #   analogioOffset = -40;
  # };

  # hardware.usb-modeswitch.enable = true;

  environment.systemPackages = with pkgs; [
    usb-modeswitch
    usb-modeswitch-data
    modemmanager
    modem-manager-gui
  ];

  services.audio-send.enable = true;

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
