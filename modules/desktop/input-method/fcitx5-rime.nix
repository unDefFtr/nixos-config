{ pkgs, ... }:

{
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    (fcitx5-rime.override {
      rimeDataPkgs = [
        pkgs.rime-ice
        pkgs.rime-data
      ];
    })
  ];
}
