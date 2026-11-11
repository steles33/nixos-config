{
  pkgs,
  lib,
  ...
}: let
  calibreWithOpenssl = pkgs.symlinkJoin {
    name = "calibre-with-openssl";
    paths = [pkgs.calibre];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/calibre \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.openssl]}
    '';
  };
in {
  programs.calibre = {
    enable = true;
    package = calibreWithOpenssl;
    plugins = [./calibre-plugins];
  };
}
