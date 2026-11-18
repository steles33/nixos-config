{
  pkgs,
  lib,
  ...
}: let
  calibreWithOpenSSL = pkgs.symlinkJoin {
    name = "calibre-with-openssl";
    paths = [pkgs.calibre];
    nativeBuildInputs = [pkgs.makeWrapper];

    postBuild = ''
      for program in calibre calibre-customize; do
        wrapProgram "$out/bin/$program" \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.openssl]} \
          --set ACSM_LIBCRYPTO "${pkgs.openssl}/lib/libcrypto.so" \
          --set ACSM_LIBSSL "${pkgs.openssl}/lib/libssl.so"
      done
    '';
  };
in {
  programs.calibre = {
    enable = true;
    package = calibreWithOpenSSL;
  };

  home.activation.installCalibrePlugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${calibreWithOpenSSL}/bin/calibre-customize \
      --add-plugin ${./calibre-plugins/DeDRM.zip}

    ${calibreWithOpenSSL}/bin/calibre-customize \
      --add-plugin ${./calibre-plugins/DeACSM.zip}
  '';
}
