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

    ../../modules/desktop/kde.nix
    ../../modules/hardware/audio.nix
    ../../modules/services/ssh.nix
  ];

  networking.hostName = "nixos";

  system.stateVersion = "25.11";
}

