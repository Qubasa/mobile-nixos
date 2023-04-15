{ stdenv, dbus, tinyalsa, pkg-config, fetchFromGitLab }:
stdenv.mkDerivation rec {
  name = "q6voiced";
  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "q6voiced";
    rev = "736138bfc9f7b455a96679e2d67fd922a8f16464";
    sha256 = "sha256-7k5saedIALHlsFHalStqzKrqAyFKx0ZN9FhLTdxAmf4=";
  };
  buildPhase = ''
    mkdir -p $out/bin
    $CC $($PKG_CONFIG --cflags --libs dbus-1) -ltinyalsa ${name}.c -o "$out/bin/${name}"
  '';
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ tinyalsa dbus ];
}
