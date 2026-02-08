{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    ranger
  ];
}

