{ stdenv, pkgs, day }:

let
  rawplays = import ./rawplays.nix { inherit stdenv pkgs; };

in stdenv.mkDerivation rec {
  name = "dailyplays-${day}";

  buildInputs = [
    rawplays
    pkgs.python34
  ];

  src = ./scripts;

  buildPhase = "
    python3 dailyplays.py ${rawplays}/plays.ldj ${day}
  ";

  installPhase = "
    mkdir $out
    cp dailyplays.ldj $out/dailyplays.ldj
  ";
}
