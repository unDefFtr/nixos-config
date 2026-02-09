{ pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;
  programs.waybar.enable = true;
  services.mako.enable = true;
  home.packages = with pkgs; [
    swaylock-effects
  ];
}
