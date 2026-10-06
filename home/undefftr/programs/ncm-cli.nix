{ pkgs, ... }:

let
  ncm-cli = pkgs.callPackage ./ncm-cli {};
in
{
  home.packages = with pkgs; [
    ncm-cli
    mpv
  ];
}
