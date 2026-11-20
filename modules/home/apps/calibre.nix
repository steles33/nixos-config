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
      for program in calibre calibre-customize calibre-debug; do
        wrapProgram "$out/bin/$program" \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.openssl]} \
          --set ACSM_LIBCRYPTO "${pkgs.openssl.out}/lib/libcrypto.so.3" \
          --set ACSM_LIBSSL "${pkgs.openssl.out}/lib/libssl.so.3"
      done
    '';
  };
in {
  programs.calibre = {
    enable = true;
    package = calibreWithOpenSSL;
    plugins = [
      ./calibre-plugins/DeACSM.zip
      ./calibre-plugins/DeDRM.zip
    ];
  };
}
