{ pkgs, ... }:

{
  home.username = "undefftr";
  home.homeDirectory = "/home/undefftr";
  home.stateVersion = "25.11";

  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/rime.nix
    ./programs/wm-tools.nix
    ./programs/zsh.nix
  ];
}

