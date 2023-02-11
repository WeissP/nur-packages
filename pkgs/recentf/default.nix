rustPlatform.buildRustPackage rec {
  pname = "recentf";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "WeissP";
    repo = pname;
    rev = version;
    sha256 = "1iga3320mgi7m853la55xip514a3chqsdi1a1rwv25lr9b1p7vd3";
  };

  cargoSha256 = "17ldqr3asrdcsh4l29m3b5r37r5d0b3npq1lrgjmxb6vlx6a36qh";

  meta = with stdenv.lib; {
    description = "Rust version of emacs recentf";
    homepage = "https://github.com/WeissP/recentf";
  };
}
