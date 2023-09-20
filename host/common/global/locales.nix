{lib, ...}:

{
  i18n.supportedLocales = ["all"];
  i18n.defaultLocale = "de_CH.UTF-8";
  console = {
    keyMap = lib.mkDefault "sg";
    useXkbConfig = true;
  };
}