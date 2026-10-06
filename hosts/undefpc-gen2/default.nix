{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/core/boot.nix
    ../../modules/core/locale.nix
    ../../modules/core/networking.nix
    ../../modules/core/users.nix
    ../../modules/core/nix.nix
    ../../modules/core/qemu.nix
    ../../modules/core/packages.nix

    ../../modules/core/proxy.nix

    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix

    ../../modules/desktop/display-manager/sddm.nix

    ../../modules/desktop/desktop-environment/plasma.nix
    ../../modules/desktop/window-manager/niri.nix
    ../../modules/desktop/window-manager/mango.nix
    ../../modules/desktop/dwm.nix
    ../../modules/desktop/variables.nix
    ../../modules/desktop/input-method/fcitx5.nix
    ../../modules/desktop/input-method/fcitx5-rime.nix

    ../../modules/desktop/fonts.nix
    
    ../../modules/desktop/steam.nix
    ../../modules/desktop/awww.nix
    ../../modules/desktop/dms-shell.nix

    ../../modules/services/ssh.nix
  ];

  networking.hostName = "unDefNixOS";

  system.stateVersion = "25.11";
}

