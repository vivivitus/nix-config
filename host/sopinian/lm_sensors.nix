{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    lm_sensors
    nvme-cli
    smartmontools
    udisks2
  ];

  environment.etc."sensors.d/asrock-b450.conf".text = ''

    chip "nct6792-isa-*"

      ##############
      ## VOLTAGES ##
      ##############

      label in0 "VCore"
      compute in0 @*2, @/2
      set in0_max 1.5

      label in2 "AVCC"
      set in2_min 3.3*0.95
      set in2_max 3.3*1.05

      label in3 "+3.3V"
      set in3_min 3.3 * 0.95
      set in3_max 3.3 * 1.05

      label in7 "3VSB"
      set in7_min 3.3 * 0.95
      set in7_max 3.3 * 1.05

      label in8 "VBat"
      set in8_min 3.3 * 0.95
      set in8_max 3.3 * 1.05

      label in9 "+1.8V"
      set in9_min 1.8 * 0.9
      set in9_max 1.8 * 1.1

      label in12 "+12.0V"
      compute in12 @*(66/10), @/(66/10)
      set in12_min 12.0 * 0.95
      set in12_max 12.0 * 1.05

      label in13 "+5.0V"
      compute in13 @*3, @/3
      set in13_min 5.0 * 0.95
      set in13_max 5.0 * 1.05

      # Ignore sensors with input 0V
      ignore in1
      ignore in4
      ignore in5
      ignore in14

      # Unknown voltages are in6, in10, in11
      ignore in6
      ignore in10
      ignore in11

      ##################
      ## TEMPERATURES ##
      ##################

      label temp3 "Mainboard"
      set temp3_max 55
      set temp3_max_hyst 50

      label temp7 "System Management Bus"

      # Values are always zero
      ignore temp8
      ignore temp9
      ignore temp10

      # Constant negative values
      ignore temp2
      ignore temp6

      # Unknown temperatures
      ignore temp1
      ignore temp4
      ignore temp5

      ##########
      ## FANS ##
      ##########

      label fan1 "PSU Fan"
      set fan1_min 0
      label fan2 "CPU Fan"
      set fan2_min 500
      label fan3 "Case Fan"
      set fan3_min 0

      # Zero or not connected
      ignore fan4
      ignore fan5

      ############
      ## OTHERS ##
      ############

      ignore intrusion0
      ignore intrusion1
      ignore beep_enable
      
    chip "k10temp-pci-*"
      label temp1 "CPU Control (Package)"
      label temp2 "CPU Die (Chip)"

    chip "iwlwifi-virtual-0"
      label temp1 "Wifi Adapter"
  '';
}