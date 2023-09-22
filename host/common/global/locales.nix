{lib, ...}:

{
  #i18n.supportedLocales = ["all"];
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = lib.mkDefault "de_CH-latin1";
    useXkbConfig = true;
  };

  i18n.extraLocaleSettings = {
    LC_ALL="en_US.UTF-8";
    LC_MEASUREMENT="de_CH.UTF-8";
  };
}