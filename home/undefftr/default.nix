{ pkgs, ... }:

{
  home.username = "undefftr";
  home.homeDirectory = "/home/undefftr";
  home.stateVersion = "25.11";

  imports = [
    ./packages.nix
    ./git.nix
  ];
}

