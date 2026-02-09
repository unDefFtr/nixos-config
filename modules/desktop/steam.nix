{ pkgs, inputs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = [
      inputs.dw-proton.packages.${pkgs.stdenv.hostPlatform.system}.dw-proton
    ];
  };
}
