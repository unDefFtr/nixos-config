{ pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  services.mako.enable = true;
}
