{ lib, pkgs, ... }:

# Rime configuration is read-only; edit this module (or add declarative
# *.custom.yaml overrides), not ~/.local/share/fcitx5/rime symlinks.
# Before first activation, stop fcitx5 and back up ~/.local/share/fcitx5
# together with ~/.config/fcitx5. Move conflicting static files into that
# backup: Home Manager otherwise keeps identical regular files unlinked.
# Apply through the host's Home Manager activationPackage, then restart fcitx5.

let
  # Match the existing user data rather than upgrading it during migration.
  rimeSource = pkgs.fetchFromGitHub {
    owner = "iDvel";
    repo = "rime-ice";
    rev = "23f0c39a0b443524e37dbff4f085236b32691291";
    hash = "sha256-Y6/tU63+JQ9HX1m/kI9VQz6tIhFVRAPSsp6Vf47gzUk=";
  };
  emojiConfig = builtins.fromJSON (builtins.readFile "${rimeSource}/opencc/emoji.json");
  files = [
    "default.yaml"
    "custom_phrase.txt"
    "rime_ice.dict.yaml"
    "radical_pinyin.dict.yaml"
    "melt_eng.dict.yaml"
    "melt_eng.schema.yaml"
    "double_pinyin.schema.yaml"
    "double_pinyin_abc.schema.yaml"
    "double_pinyin_flypy.schema.yaml"
    "double_pinyin_jiajia.schema.yaml"
    "double_pinyin_mspy.schema.yaml"
    "double_pinyin_sogou.schema.yaml"
    "double_pinyin_ziguang.schema.yaml"
    "t9.schema.yaml"
    "symbols_v.yaml"
    "symbols_caps_v.yaml"
    "squirrel.yaml"
    "weasel.yaml"
    "cn_dicts"
    "en_dicts"
    "lua"
    "opencc/emoji.txt"
    "opencc/others.txt"
  ];
in
{
  # rime_ice/radical_pinyin schemas are supplied by the system addon, as before.
  # Link individual files: build/, userdb, sync and installation state must stay writable.
  xdg.dataFile = lib.genAttrs (map (file: "fcitx5/rime/${file}") files) (
    name: {
      source = "${rimeSource}/${lib.removePrefix "fcitx5/rime/" name}";
      recursive = true;
    }
  ) // {
    # OpenCC 1.4 requires an explicit policy; retain the legacy first-match behavior.
    "fcitx5/rime/opencc/emoji.json".text = builtins.toJSON (emojiConfig // {
      conversion_chain = map (step: step // {
        dict = step.dict // { match_policy = "short_circuit"; };
      }) emojiConfig.conversion_chain;
    });
  };
}
