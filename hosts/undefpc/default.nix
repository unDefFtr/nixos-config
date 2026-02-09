{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/core/boot.nix
    ../../modules/core/locale.nix
    ../../modules/core/networking.nix
    ../../modules/core/users.nix
    ../../modules/core/nix.nix
    ../../modules/core/packages.nix

    ../../modules/core/proxy.nix

    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix

    ../../modules/desktop/kde.nix
    ../../modules/desktop/niri.nix

    ../../modules/desktop/input-method/fcitx5.nix
    ../../modules/desktop/input-method/fcitx5-rime.nix

    ../../modules/desktop/fonts.nix
    
    ../../modules/desktop/steam.nix
    ../../modules/desktop/awww.nix

    ../../modules/services/ssh.nix
  ];

  networking.hostName = "unDefNixOS";

  system.stateVersion = "25.11";
}

