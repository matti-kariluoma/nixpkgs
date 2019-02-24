{ stdenv, fetchFromGitHub, qtbase, qtserialport, qmake }:

stdenv.mkDerivation rec {
  name = "candle-${version}";
  version = "1.1";

  src = fetchFromGitHub {
    owner  = "Denvi";
    repo   = "Candle";
    rev    = "v${version}";
    sha256 = "1gpx08gdz8awbsj6lsczwgffp19z3q0r2fvm72a73qd9az29pmm0";
  };

  buildPhase = ''
    cd src
    qmake
    buildPhase
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp Candle $out/bin/
  '';

  buildInputs = [ qtbase qtserialport ];

  meta = with stdenv.lib; {
    description = "GRBL controller application with G-Code visualizer written in Qt";
    homepage = https://github.com/Denvi/Candle;
    license = licenses.gpl3;
    maintainers = [ maintainers.matti-kariluoma ];
    platforms = platforms.all;
  };
}
