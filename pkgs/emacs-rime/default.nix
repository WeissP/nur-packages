{ fetchFromGitHub, gcc, emacs, librime, stdenv, librime-mac }:

stdenv.mkDerivation rec {
  pname = "emacs-rime";
  version = "v1.0.5";

  src = fetchFromGitHub {
    owner = "DogLooksGood";
    repo = "emacs-rime";
    rev = version;
    hash = "sha256-Z4hGsXwWDXZie/8IALhyoH/eOVfzhbL69OiJlLHmEXw=";
  };

  buildInputs = [ gcc emacs ]
    ++ (if stdenv.isDarwin then [ librime-mac ] else [ librime ]);

  buildPhase = "make lib";

  installPhase = ''
    mkdir -p $out/include
    cp librime-emacs.so $out/include/librime-emacs.so
  '';

  meta = {
    description = "Emacs rime dynamic module";
    homepage = "https://github.com/DogLooksGood/emacs-rime";
  };
}
