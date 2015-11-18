{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "rawplays";

  buildInputs = [ pkgs.python34 ];

  src = ./scripts;

  buildPhase = "
    python3 makesample.py > plays.json
  ";

  installPhase = "
    mkdir $out
    cp plays.json $out/plays.ldj
  ";
}