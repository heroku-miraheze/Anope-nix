{ pkgs ? import <nixpkgs> {}}:
{ bash, libmysqlclient, autoconf, make, gcc }:
{
  stdenv.mkDerivation {
    name = anope;
    version = 2.0.9;

    buildInputs = [ bash libmysqlclient autoconf make gcc ];
    src = fetchurl {
      url = "https://github.com/anope/anope/archive/refs/tags/2.0.9.tar.gz";
      sha256 = d098ac3cd273c7a243fb1e32ce7aa702f09a6ca3d821a4544f72ef4d1f29ec36;
    };
    buildCommand = ''
      ./configure
      make
      make install
    '';
  }
}
