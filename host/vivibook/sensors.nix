{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    lm_sensors
    nvme-cli
    smartmontools
    udisks2
  ];

  hardware.tuxedo-rs = {
    enable = true;
    # Aktiviert die grafische Oberfläche (Alternative zum TUXEDO Control Center)
    tailor-gui.enable = true;
  };

  # Stellt sicher, dass das für lm-sensors benötigte Kernel-Modul geladen wird
  boot.kernelModules = [ "tuxedo_io" ];
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_zen.tuxedo-drivers ];

  # Die Konfiguration für lm-sensors (Sensoren sauber benennen)
  environment.etc."sensors.d/tongfang.conf".text = ''
    chip "tuxedo_io-*" "uniwill-*"
        label fan1 "Lüfter CPU"
        label fan2 "Lüfter GPU"
        
        label temp1 "Gehäuse / CPU Temp"
        label temp2 "GPU Temp (EC)"
  '';
}