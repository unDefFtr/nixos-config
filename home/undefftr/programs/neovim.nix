{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # xdg.configFile."nvim".source = ${inputs.dotfiles}/nvim;
}
