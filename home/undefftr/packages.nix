{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    git
    htop
    ranger
  ];
}

