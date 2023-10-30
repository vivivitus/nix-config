{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [ brlaser ];
  };

  environment.systemPackages = with pkgs; [
    brlaser
  ];

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_DCP-7065DN";
        location = "Home";
        deviceUri = "dnssd://Brother%20DCP-7065DN._pdl-datastream._tcp.local/";
        model = "drv:///brlaser.drv/br7065dn.ppd";
        ppdOptions = {
          PageSize = "A4";
          Duplex = "DuplexNoTumble";
        };
      }
    ];
  };

  hardware = {
    sane = {
      enable = true;
      brscan4 = {
        enable = true;
        netDevices = {
          home = { model = "DCP-7065DN"; ip = "10.0.2.30"; };
        };
      };
    };
  };
}