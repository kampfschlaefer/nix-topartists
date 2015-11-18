{ stdenv, pkgs, day }:

let
  rawplays = import ./rawplays.nix { inherit stdenv pkgs; };

in stdenv.mkDerivation rec {
  name = "dailyplays-${day}";

  buildInputs = [
    rawplays
    pkgs.python34
  ];

  srcs = [
    #../lpug-luigi  #/plays.ldj
    ./scripts
  ];
  sourceRoot = "scripts";

  buildPhase = "
    #echo \"out=$out\"
    #pwd
    #ls -la ..
    python3 dailyplays.py ${rawplays}/plays.ldj ${day}
  ";

  installPhase = "
    mkdir $out
    cp dailyplays.ldj $out/dailyplays.ldj
  ";
}
