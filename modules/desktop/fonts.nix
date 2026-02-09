{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      noto-fonts

      jetbrains-mono
      maple-mono.CN
    ];
    fontconfig = {
      enable = true;
      
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" "Noto Serif" ];
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans" ];
        monospace = [ "Maple Mono" "JetBrains Mono" "Noto Sans Mono CJK SC" ];
      };
    };
  };
}
