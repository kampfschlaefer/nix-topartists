{ stdenv, pkgs, day }:

stdenv.mkDerivation rec {
  name = "dailyplays-${day}";

  buildInputs = [
    pkgs.python34
  ];

  srcs = [
    ../lpug-luigi  #/plays.ldj
    ./scripts
  ];
  sourceRoot = "scripts";

  buildPhase = "
    #echo \"out=$out\"
    #pwd
    #ls -la ..
    python3 dailyplays.py ${day}
  ";

  installPhase = "
    mkdir $out
    cp dailyplays.ldj $out/dailyplays.ldj
  ";
}
