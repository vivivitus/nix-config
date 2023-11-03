{ pkgs, lib }:

  pkgs.stdenv.mkDerivation rec {
  pname = "libdeep_filter_ladspa";
  version = "0.5.6";
  src = pkgs.fetchurl {
    url = "https://github.com/Rikorose/DeepFilterNet/releases/download/v${version}/libdeep_filter_ladspa-${version}-x86_64-unknown-linux-gnu.so";
    sha256 = "2ca3205c2911d389604a826a240e745597d50252b5cab81c8248252b335e2236";
  };

  buildInputs = [ pkgs.ladspaPlugins ];

  phases = [ "installPhase" "postFixup" ];

  installPhase = ''
    mkdir -p $out/lib/ladspa/
    mv libdeep_filter_ladspa-${version}-x86_64-unknown-linux-gnu.so $out/lib/ladspa/libdeep_filter.so
  '';
  postFixup = ''
    for file in \
      $out/lib/ladspa/libdeep_filter.so
    do
      patchelf --set-rpath "${lib.makeLibraryPath buildInputs}" $file
    done
  '';
}