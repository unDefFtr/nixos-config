{ pkgs, lib, ... }:

{
  security.polkit.enable = true;
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    tunMode = true;
    serviceMode = true;
  };
}
