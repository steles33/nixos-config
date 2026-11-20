{
  pkgs,
  lib,
  calibrePlugins,
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

  plugins = calibrePlugins.packages.${pkgs.system};
in {
  programs.calibre = {
    enable = true;
    package = calibreWithOpenSSL;
    # Deliberately omit `plugins`: the upstream install script registers
    # these archives with calibre-customize instead.
  };

  home.activation.installCalibrePlugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Close Calibre before switching Home Manager generations.
    ${calibreWithOpenSSL}/bin/calibre-customize -r "ACSM Input" || true
    ${calibreWithOpenSSL}/bin/calibre-customize -r "DeDRM" || true

    ${calibreWithOpenSSL}/bin/calibre-customize \
      -a ${plugins."acsm-calibre-plugin"}
    ${calibreWithOpenSSL}/bin/calibre-customize \
      -a ${plugins."dedrm-plugin"}
  '';
}
