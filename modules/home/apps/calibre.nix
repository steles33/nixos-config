{
  pkgs,
  lib,
  ...
}: let
  deacsmModules =
    pkgs.runCommand "deacsm-python-modules" {
      nativeBuildInputs = [pkgs.unzip];
    } ''
      mkdir -p "$out"
      ${pkgs.unzip}/bin/unzip -q ${./calibre-plugins/DeACSM.zip} -d "$out"
    '';

  calibreWithDeACSM = pkgs.symlinkJoin {
    name = "calibre-with-deacsm";
    paths = [pkgs.calibre];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      for program in calibre calibre-customize; do
        wrapProgram "$out/bin/$program" \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.openssl]} \
          --prefix PYTHONPATH : ${deacsmModules}
      done
    '';
  };
in {
  programs.calibre = {
    enable = true;
    package = calibreWithDeACSM;
  };

  #home.activation.installDeACSM = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  ${calibreWithDeACSM}/bin/calibre-customize \
  #    --add-plugin ${./calibre-plugins/DeACSM.zip}
  #'';
}
