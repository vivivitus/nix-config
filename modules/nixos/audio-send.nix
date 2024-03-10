{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.services.audio-send;
in {
  options.services.audio-send = {
    enable = mkEnableOption "Enable audio-send service";
  };

  config = mkIf cfg.enable {
    systemd.services.audio-send = {

      description = "audio-send server daemon.";

      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      restartIfChanged = true;

      path = with pkgs.gst_all_1; [
        gstreamer
        gst-plugins-base
        gst-plugins-good
      ];

      serviceConfig = {
        ExecStart = "${pkgs.gst-send}/bin/gst-send --ips 172.16.1.11,172.16.1.12 --port 5001";
        Restart = "always";
      };
    };
  };
}