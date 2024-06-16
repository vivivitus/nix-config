{
  boot = {
    plymouth.enable = true;
    plymouth.theme = "breeze";
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [ "quiet" ];
    loader.timeout = 10;
  };
}