{
  lib,
  buildNpmPackage,
  nodejs_22,
}:

buildNpmPackage {
  pname = "ncm-cli";
  version = "0.1.6";

  src = ./.;
  nodejs = nodejs_22;

  npmDepsHash = "sha256-6Tr6u7T5ANK3gBjxEFtyBTt8lHr/fHWP++ZOBjDmNMk=";
  dontNpmBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/ncm-cli $out/bin
    cp -r node_modules $out/lib/ncm-cli/

    ln -s \
      $out/lib/ncm-cli/node_modules/.bin/ncm-cli \
      $out/bin/ncm-cli

    runHook postInstall
  '';

  meta = {
    description = "NetEase Cloud Music command-line client";
    license = lib.licenses.mit;
    mainProgram = "ncm-cli";
    platforms = lib.platforms.linux;
  };
}
