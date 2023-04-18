{ fetchzip, stdenv }:

stdenv.mkDerivation rec {
  pname = "librime-mac";
  version = "1.8.4";

  src = (fetchzip {
    url =
      "https://github.com/rime/librime/releases/download/1.8.4/rime-a94739f-macOS.tar.bz2";
    sha256 = "sha256-rxkbiTIC8+i8Zr66lfj6JDFOf4ju8lo3dPP1UDIPC1c=";
    stripRoot = false;
  });

  buildInputs = [ ];

  buildPhase = "";

  installPhase = ''
    mkdir -p $out
    cp -R ./dist/* $out
  '';

  meta = {
    description = "librime for emacs-rime on MacOS";
    homepage = "https://github.com/rime/librime";
  };
}
