{ pkgs, ... }:

{
  #xdg.dataFile."fcitx5/rime".source = "${pkgs.rime-ice}/share/rime-data";
  #xdg.dataFile."fcitx5/rime/default.custom.yaml".text = ''
  #  patch:
  #    __include: rime_ice_suggestion:/rime-ice
  #  
  #    schema_list:
  #      - rime_ice
  #'';
  # xdg.dataFile."fcitx5/rime/rime-ice".source = "${pkgs.rime-ice}/share/rime-data";
  # xdg.dataFile."fcitx5/rime/rime-data".source = "${pkgs.fcitx5-rime}/share/rime-data";
}
