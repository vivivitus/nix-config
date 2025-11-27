{ config, ... }:

{
  networking.firewall.allowedTCPPorts = [ 8123 ];
  services.zigbee2mqtt.enable = true;
  services.zigbee2mqtt.settings = {
    homeassistant = config.services.home-assistant.enable;
    permit_join = true;
    mqtt = {
      server = "mqtt://10.0.2.10:1883";
    };
    serial = {
      port = "/dev/ttyACM0";
    };
  };
  services.home-assistant = {
    enable = true;
    extraComponents = [
      # Components required to complete the onboarding
      "esphome"
      "homeassistant_hardware"
      "zha"
      "mqtt"
      "manual_mqtt"
      "mqtt_statestream"
      "mqtt_eventstream"
      "mqtt_json"
      "mqtt_room"
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {};
      automation = "!include automations.yaml";
      sensor = "!include sensor.yaml";
    };
  };
}