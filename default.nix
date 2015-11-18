{ }:

with import <nixpkgs> {};

let
  firstweek = callPackage ./topartists_range.nix { range=[1 7]; };
  lastweek = callPackage ./topartists_range.nix { range=[24 31]; };
  firsthalf = callPackage ./topartists_range.nix { range=[1 15]; };

in stdenv.mkDerivation rec {
  name = "nixtopartists";

  src = ./scripts;

  buildInputs = [
    pkgs.python34
    firstweek
    lastweek
    firsthalf
  ];

  buildPhase = "";

  installPhase = "
    mkdir $out
    cp ${firstweek}/topartists.ldj $out/topartists_firstweek.ldj
    cp ${lastweek}/topartists.ldj $out/topartists_lastweek.ldj
    cp ${firsthalf}/topartists.ldj $out/topartists_firsthalf.ldj
  ";

}
