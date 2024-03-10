{
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [ "quiet" ];
    loader.timeout = 10;
  };
}