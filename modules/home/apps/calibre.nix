{
  pkgs,
  lib,
  ...
}: let
  calibreWithDeACSM = pkgs.symlinkJoin {
    name = "calibre-with-deacsm";
    paths = [pkgs.calibre];
    nativeBuildInputs = [pkgs.makeWrapper];

    postBuild = ''
      for program in calibre calibre-customize; do
        wrapProgram "$out/bin/$program" \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.openssl]} \
          --set ACSM_LIBCRYPTO "${pkgs.openssl.out}/lib/libcrypto.so" \
          --set ACSM_LIBSSL "${pkgs.openssl.out}/lib/libssl.so"
      done
    '';
  };
in {
  programs.calibre = {
    enable = true;
    package = calibreWithDeACSM;
  };
}
