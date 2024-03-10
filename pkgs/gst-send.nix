{ pkgs }: {

  gst-send = pkgs.stdenv.mkDerivation {
    name = "gst-send";
    propagatedBuildInputs = with pkgs; [
      python3
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
    ];
    dontUnpack = true;
    installPhase = "install -Dm755 ${./src/gst-source.py} $out/bin/gst-source";
  };
}