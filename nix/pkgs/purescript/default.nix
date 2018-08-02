{ stdenv
, fetchurl
, gmp
, zlib
, ncurses5
}:
let
  dynamic-linker = "${stdenv.glibc.out}/lib/ld-linux-x86-64.so.2";
in
stdenv.mkDerivation rec {
  name = "purescript-${version}";
  version = "0.12.0";

  # TODO: support osx too
  src = fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
    sha256 = "1wf7n5y8qsa0s2p0nb5q81ck6ajfyp9ijr72bf6j6bhc6pcpgmyc";
  };

  doBuild = false;

  installPhase = ''
    mkdir -p $out/bin
    install -D -m555 -T purs $out/bin/purs
  '';

  postFixup = ''
    patchelf --set-interpreter ${dynamic-linker} $out/bin/purs
    patchelf --shrink-rpath $out/bin/purs
    patchelf --set-rpath ${zlib}/lib:${gmp}/lib:${ncurses5}/lib $out/bin/purs
  '';
}
