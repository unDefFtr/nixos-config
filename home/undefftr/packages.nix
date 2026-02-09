{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    ranger
    qq
    lutris
    protonup-ng
    microsoft-edge
  ];
}

